extends Control

@onready var pause: Button = $"../Pause button"

const MENU = preload("uid://6mykfocqfpke")

func _ready() -> void:
	visible = false

func _on_pause_button_pressed() -> void:
	visible = true
	pause.visible = false

func _on_resume_pressed() -> void:
	visible = false
	pause.visible = true

func _on_instructions_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_packed(MENU)
