extends Area2D
class_name NPC

@export var atributes: NPCAtributes
@onready var Animator = $NPCAnimator as AnimationPlayer
@onready var dialogBox: RichTextLabel = $"../../UI/Dialog"

var GameDocuments: Array = ["res://Scenes/Documents/Document.tscn"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Animator.play("Comming")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func StartDialog():
	dialogBox.dialog = atributes.dialog
	dialogBox.visible = true
	dialogBox.ShowMessage()
	dialogBox.currentNPC = $"."
