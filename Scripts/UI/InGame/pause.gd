extends Control

@onready var pause: TextureButton = $"../Pause button"

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && $Guide.visible:
		$Guide.visible = false

func _on_pause_button_pressed() -> void:
	visible = true
	pause.visible = false

func _on_resume_pressed() -> void:
	visible = false
	pause.visible = true

func _on_instructions_pressed() -> void:
	$Guide.visible = true

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
