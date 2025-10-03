extends Control

const SHERIFFS_BOX = preload("uid://3o1b3o2tyyeg")

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_packed(SHERIFFS_BOX)

func _on_button_options_pressed() -> void:
	pass # Replace with function body.

func _on_button_credits_pressed() -> void:
	pass # Replace with function body.

func _on_button_exit_pressed() -> void:
	get_tree().quit()
