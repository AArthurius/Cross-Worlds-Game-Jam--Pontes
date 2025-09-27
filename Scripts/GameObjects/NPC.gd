extends Node2D

class NPC:
	var Name: String
	var Dialog: Array
	var NumberOfDocuments: int
	var Documents: Array
	var CanAcross: bool

var NPCAtributes: NPC

@onready var Animator = $NPCAnimator as AnimationPlayer
var GameDocuments: Array = ["res://Scenes/Documents/Document.tscn"]

@onready var DialogBox: Node2D = $"../Dialog"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogBox.Dialog = ["Teste", "teste2", "teste3"]
	DialogBox.visible = true
	DialogBox.ShowMessage()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func NewNPC():
	pass
