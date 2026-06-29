extends Control
const GAMEPLAY_SCENE = "res://scenes/gameplay.tscn"

func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().change_scene_to_file(GAMEPLAY_SCENE)
