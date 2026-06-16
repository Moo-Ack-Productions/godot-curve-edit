@tool
extends EditorPlugin


var plugin : EditorInspectorPlugin


func _enter_tree():
	print("Curve Edit: enter tree")
	plugin = preload("res://addons/curve_edit/path_edit.gd").new()
	add_inspector_plugin(plugin)


func _exit_tree():
	print("Curve Edit: exit tree")
	if plugin != null:
		remove_inspector_plugin(plugin)


func refresh() -> void:
	get_editor_interface().get_inspector().refresh()
