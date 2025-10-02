extends Button


@onready var animator: AnimationPlayer = $Animator
@onready var documentsManager: Node2D = $"../../DocumentsManager"

const PASS = preload("uid://c4miyjth67lhb")


func _on_mouse_entered() -> void:
	animator.play("PassShake")


func _on_button_down() -> void:
	for doc in documentsManager.get_children():
		if doc.is_in_group("pass"):
			return
	var citadelPass = PASS.instantiate()
	if !GameManager.isDraggingADocument:
		citadelPass.isDragging = true
		citadelPass._on_drag_button_down()
	documentsManager.add_child(citadelPass)
