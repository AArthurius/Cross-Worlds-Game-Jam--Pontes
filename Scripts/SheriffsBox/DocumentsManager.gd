extends Node2D

func DragDocument(document: Node2D) -> void:
	document.global_position = get_local_mouse_position() + position
	move_child(document, get_child_count() - 1)
	GameManager.isDraggingADocument = true
