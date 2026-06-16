extends EditorInspectorPlugin

const TransformPanel = preload("res://addons/curve_edit/transform_panel.tscn")
var panel_instance


func _can_handle(object) -> bool:
	# Only paths are supported.
	return object is Path3D or object is Path2D


## Add the custom draw under the object-level transform panel.
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide) -> bool:
	#print("Name: ", name, " | Usage flags: ", usage_flags, " | Hint Type: ", hint_type, " | Hint String: ", hint_string, " | Usage Flags: ", usage_flags)
	if name == "position": # Place directly after the obj-scale transform
		panel_instance = TransformPanel.instantiate()
		add_custom_control(panel_instance)
		panel_instance.call_deferred("update_current_transform", object)
	return false

