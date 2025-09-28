extends Node2D
class_name Document

@onready var Animator: AnimationPlayer = $Animator
var MouseEntered: bool = false
var isOnNPCArea: bool = false
		
func _ready() -> void:
	Animator.play("Drop")
		
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && MouseEntered && !GameManager.isDraggingADocument:
		get_parent().DragDocument($".")
	else: 
		GameManager.isDraggingADocument = false
		if isOnNPCArea && !Animator.is_playing() && !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			queue_free()

func OnMouseEntered() -> void:
	MouseEntered = true

func OnMouseExited() -> void:
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		MouseEntered = false

func AreaEntered(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = true

func AreaExited(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = false
