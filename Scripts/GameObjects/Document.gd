extends Node2D
class_name Document

var MouseEntered: bool = false
		
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && MouseEntered && !GameManager.isDraggingADocument:
		get_parent().DragDocument($".")
		GameManager.isDraggingADocument = true
	else: GameManager.isDraggingADocument = false

func OnMouseEntered() -> void:
	MouseEntered = true

func OnMouseExited() -> void:
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		MouseEntered = false
