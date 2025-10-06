extends Control

const SHERIFFS_BOX = preload("uid://3o1b3o2tyyeg")
@onready var Credits = $"../Credits"
@onready var Guide = $"../Guide"

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && (Credits.visible || Guide.visible):
		Credits.visible = false
		Guide.visible = false

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_packed(SHERIFFS_BOX)

func _on_button_guide_pressed() -> void:
	Guide.visible = true

func _on_button_credits_pressed() -> void:
	Credits.visible = true

func _on_button_exit_pressed() -> void:
	get_tree().quit()

func MusicFinished() -> void:
	$"../Music".play()
