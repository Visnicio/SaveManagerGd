extends Node2D

@onready var game_save_name: LineEdit = $GameSaveName

var username: String = ""
@onready var username_input: LineEdit = $UsernameInput
@onready var username_label: Label = $Username


func _ready() -> void:
	SaveManager.game_loaded.connect(_on_game_loaded)

func _on_save_pressed() -> void:
	SaveManager.save_data["username"] = username_input.text
	SaveManager.game_save_name = game_save_name.text
	SaveManager.save_game()
	pass # Replace with function body.


func _on_load_pressed() -> void:
	SaveManager.game_save_name = game_save_name.text # targets the desired file to load, if you saved with another format dont forget to change it too
	SaveManager.load_game()


func _on_game_loaded() -> void:
	username = SaveManager.save_data["username"]
	username_label.text = username
