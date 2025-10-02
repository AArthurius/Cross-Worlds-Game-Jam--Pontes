extends item

var approved: bool = false
var denied:bool = false
var isOnNPCArea:bool = false
var npc:NPC
var stamped

func _process(delta: float) -> void:
	dragManager()

func dropped():
	if !isDragging and npc != null and !stamped:
		if isOnNPCArea and (approved or denied):
			if denied:
				npc.denied = true
			elif approved:
				npc.accepted = true
			GameManager.isDraggingADocument = false
			queue_free()
	stamped = false

func _on_drag_button_up() -> void:
	isDragging = false
	dropped()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = true
		npc = area

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = false
		npc = null
