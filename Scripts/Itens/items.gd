extends Area2D
class_name item

var offset:Vector2 = Vector2(25.0, 0)
var isDragging: bool = false

func _process(delta: float) -> void:
	dragManager()

func dragManager():
	if isDragging:
		get_parent().DragDocument($".", offset)
		GameManager.isDraggingADocument = true
	else: 
		GameManager.isDraggingADocument = false

func _on_drag_button_down() -> void:
	if !GameManager.isDraggingADocument:
		isDragging = true

func _on_drag_button_up() -> void:
	isDragging = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_on_drag_button_up()
