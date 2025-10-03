extends Control

@onready var pause: Button = $"../Pause button"


func _on_pause_button_pressed() -> void:
	visible = true
	pause.visible = false

func _on_resume_pressed() -> void:
	visible = false
	pause.visible = true

func _on_instructions_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	pass # Replace with function body.
