extends Node2D

var number: int = 0
var user_name: String = ""

func _ready() -> void:
	SaveManager.game_loaded.connect(_on_game_loaded)
	pass

func _on_increase_pressed() -> void:
	number += 1
	$Value.text = str(number)
	pass # Replace with function body.


func _on_decrease_pressed() -> void:
	number -= 1
	$Value.text = str(number)
	pass # Replace with function body.

#region Game Saving

func _on_save_pressed() -> void:
	SaveManager.save_data["number"] = number
	SaveManager.save_data["user_name"] = $Name.text
	SaveManager.save_game()

#endregion

#region Game Loading

func _on_load_pressed() -> void:
	SaveManager.load_game()
	pass # Replace with function body.


func _on_game_loaded() -> void:
	number = SaveManager.save_data["number"]
	user_name = SaveManager.save_data["user_name"]
	$Value.text = str(number)
	$Name.text = user_name 

#endregion
