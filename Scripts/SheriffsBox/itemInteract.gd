extends Control


@onready var animator_stamp_1: AnimationPlayer = $"Animator Stamp1"
@onready var animator_stamp_2: AnimationPlayer = $"Animator Stamp2"
@onready var animator_campainha: AnimationPlayer = $"Animator Campainha"
@onready var documentsManager: Node2D = $"../DocumentsManager"
@onready var carimbo1: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo 1"
@onready var carimbo2: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo Pequeno"

const STAMPER_DENIED = preload("uid://d3qvbnjvp8t0t")
const STAMPER_APPROVED = preload("uid://d3788yhknvdyc")



func Stamp_1_button_pressed() -> void:
	if GameManager.isDraggingADocument:
		print("dragging")
		return
	for doc in documentsManager.get_children():
		if doc is item and !doc.is_in_group("pass"):
			return
	carimbo1.visible = false
	var stamper = STAMPER_DENIED.instantiate()
	stamper.isDragging = true
	stamper._on_drag_button_down()
	stamper.tree_exited.connect(Stamp1QueueFree)
	documentsManager.add_child(stamper)

func Stamp_2_button_pressed() -> void:
	if GameManager.isDraggingADocument:
		return
	for doc in documentsManager.get_children():
		if doc is item and !doc.is_in_group("pass"):
			return
	carimbo2.visible = false
	var stamper = STAMPER_APPROVED.instantiate()
	stamper.isDragging = true
	stamper._on_drag_button_down()
	stamper.tree_exited.connect(Stamp2QueueFree)
	documentsManager.add_child(stamper)

func Stamp1QueueFree():
	carimbo1.visible = true

func Stamp2QueueFree():
	carimbo2.visible = true

func Stamp_1_button_mouse_entered() -> void:
	animator_stamp_1.play("stamp 1")

func Stamp_1_button_mouse_exited() -> void:
	animator_stamp_1.play_backwards("stamp 1")

func Stamp_2_button_mouse_entered() -> void:
	animator_stamp_2.play("stamp 2")

func Stamp_2_button_mouse_exited() -> void:
	animator_stamp_2.play_backwards("stamp 2")
