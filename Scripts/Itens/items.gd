extends Area2D
class_name item

var isDragging: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dragManager()

func dragManager():
	if isDragging:
		get_parent().DragDocument($".")
		GameManager.isDraggingADocument = true
	else: 
		GameManager.isDraggingADocument = false

func _on_drag_button_down() -> void:
	if !GameManager.isDraggingADocument:
		isDragging = true

func _on_drag_button_up() -> void:
	isDragging = false
