@tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_autoload_singleton("SaveManager", "res://addons/save_manager_gd/save_manager/save_manager.tscn")
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
