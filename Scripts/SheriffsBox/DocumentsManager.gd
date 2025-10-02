extends Node2D

@onready var carimbo1: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo 1"
@onready var carimbo2: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo Pequeno"


var spot1Free = true
var spot2Free = true
var spot3Free = true
var spot4Free = true

var spots: Array = [Vector2(-132, 80), Vector2(-109, 80), Vector2(-86, 80), Vector2(-63, 80)]

func dropDocument(doc:Document):
	var spot:int = randi_range(0, 3)
	while !checkSpot(spot):
		spot = randi_range(0, 3)
	var tween = create_tween()
	tween.tween_property(doc, "position", spots[spot], 0.3)

func DragDocument(document: Node2D) -> void:
	document.global_position = (get_local_mouse_position() + position) - Vector2(25.0, 0)
	move_child(document, get_child_count() - 1)
	GameManager.isDraggingADocument = true

func checkSpot(spot:int) -> bool:
	if spot == 0 and spot1Free:
		return true
	if spot == 1 and spot2Free:
		return true
	if spot == 2 and spot3Free:
		return true
	if spot == 3 and spot4Free:
		return true
	return false
