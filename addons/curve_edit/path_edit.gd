extends EditorInspectorPlugin

const TransformPanel = preload("res://addons/curve_edit/transform_panel.tscn")
const TransformPanelGd = preload("res://addons/curve_edit/transform_panel.gd")

var panel_instance


func _can_handle(object) -> bool:
	return object is Path3D  # TODO: or object is Path2D


## Add the custom draw under the object-level transform panel.
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide) -> bool:
	#print("Name: ", name, " | Usage flags: ", usage_flags, " | Hint Type: ", hint_type, " | Hint String: ", hint_string, " | Usage Flags: ", usage_flags)
	if name == "position": # Place directly after the obj-scale transform
		panel_instance = TransformPanel.instantiate()
		add_custom_control(panel_instance)
		panel_instance.point_value_changed.connect(_on_point_value_changed)
		panel_instance.call_deferred("update_current_transform", object)
	return false


func _on_point_value_changed(path: Path3D, index: int, part: int, new_value: Vector3) -> void:
	if not path or not path.curve:
		return
	
	var curve = path.curve
	var old_value : Vector3
	var method_name : String
	var action_name: String

	if part == TransformPanelGd.POS:
		old_value = curve.get_point_position(index)
		method_name = "set_point_position"
		action_name = "Modify Curve Point Position"
	elif part == TransformPanelGd.IN:
		old_value = curve.get_point_in(index)
		method_name = "set_point_in"
		action_name = "Modify Curve Point In"
	elif part == TransformPanelGd.OUT:
		old_value = curve.get_point_out(index)
		method_name = "set_point_out"
		action_name = "Modify Curve Point Out"
	else:
		return

	var undo_redo = EditorInterface.get_editor_undo_redo()
	undo_redo.create_action(action_name, UndoRedo.MERGE_DISABLE, path)
	undo_redo.add_do_method(curve, method_name, index, new_value)
	undo_redo.add_do_method(curve, "emit_changed")
	undo_redo.add_undo_method(curve, method_name, index, old_value)
	undo_redo.add_undo_method(curve, "emit_changed")
	
	undo_redo.commit_action()
