extends Control


@onready var animator_stamp_1: AnimationPlayer = $"Animator Stamp1"
@onready var animator_stamp_2: AnimationPlayer = $"Animator Stamp2"
@onready var animator_stamp_3: AnimationPlayer = $"Animator Stamp3"
@onready var animator_campainha: AnimationPlayer = $"Animator Campainha"

@onready var carimbo1: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo 1"
@onready var carimbo2: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo Pequeno"
@onready var carimbo3: MeshInstance3D = $"../../SubViewportContainer/SubViewport/Environment/Carimbos/Carimbo Grande"

const STAMPER_QUADRADO = preload("uid://cvjf41uk6ospv")
const STAMPER = preload("uid://dq17ax7m6ukjq")

var carimbo1Out:bool = false
var carimbo2Out:bool = false
var carimbo3Out:bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func Stamp_1_button_pressed() -> void:
	carimbo1Out = true
	carimbo1.visible = false

func Stamp_2_button_pressed() -> void:
	carimbo2Out = true
	carimbo2.visible = false

func Stamp_3_button_pressed() -> void:
	carimbo3Out = true
	carimbo3.visible = false



func _on_campainha_mouse_entered() -> void:
	pass # Replace with function body.



func _on_campainha_mouse_exited() -> void:
	pass # Replace with function body.






func Stamp_1_button_mouse_entered() -> void:
	animator_stamp_1.play("stamp 1")

func Stamp_1_button_mouse_exited() -> void:
	animator_stamp_1.play_backwards("stamp 1")

func Stamp_2_button_mouse_entered() -> void:
	animator_stamp_2.play("stamp 2")

func Stamp_2_button_mouse_exited() -> void:
	animator_stamp_2.play_backwards("stamp 2")

func Stamp_3_button_mouse_entered() -> void:
	animator_stamp_3.play("stamp 3")

func Stamp_3_button_mouse_exited() -> void:
	animator_stamp_3.play_backwards("stamp 3")
