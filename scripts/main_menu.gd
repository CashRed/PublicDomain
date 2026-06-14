extends Control
const GAMEPLAY_SCENE = "res://scenes/gameplay.tscn" #makes a path to the game's scene
const Settings_Scene = "res://scenes/settings_menu.tscn"

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(GAMEPLAY_SCENE)

func _on_settings_button_pressed() -> void:
	print("Settings opened")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
