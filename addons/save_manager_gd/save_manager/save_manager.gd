extends Node

signal game_loaded
signal game_saved
signal save_warned

var save_data : Dictionary = {} # This is higly mutable, just a holder for the data to go in and get out of the file
@export var save_path_prefix: String = "user://"
@export var game_save_name: String = "game_save"
@export var save_format: String = ".dat"

func save_game(override_save: bool = false) -> void:
	var full_path: String = save_path_prefix + game_save_name + save_format # just a simple concat
	var save_exists = FileAccess.file_exists(full_path)
	if save_exists:
		printerr("Save already exists, caution with overriding")
		save_warned.emit()
		#return
	
	if !save_exists or override_save:
		var file = FileAccess.open(full_path, FileAccess.WRITE)
		file.store_var(save_data)
		game_saved.emit()

func load_game() -> void:
	var full_path: String = save_path_prefix + game_save_name + save_format
	var file = FileAccess.open(full_path, FileAccess.READ)
	var save_exists = FileAccess.file_exists(full_path)
	
	if !save_exists:
		printerr("Save does not exist")
		return
	
	var content: Dictionary = file.get_var()
	save_data = content
	
	game_loaded.emit()
