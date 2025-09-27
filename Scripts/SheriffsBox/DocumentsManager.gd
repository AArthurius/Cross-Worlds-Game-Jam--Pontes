extends Node2D

func DragDocument(Document: Node2D) -> void:
	Document.global_position = get_local_mouse_position()
	move_child(Document, get_child_count() - 1)
