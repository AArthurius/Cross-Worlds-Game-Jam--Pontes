extends Area2D
class_name NPC

@export var atributes: NPCAtributes
@onready var animator: AnimationPlayer = $NPCAnimator
@onready var dialogBox: RichTextLabel = $"../../../UI/Dialog"
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.texture = atributes.NPCTexture
	animator.play("Coming")

func StartDialog():
	dialogBox

func npc_animator_finished(anim_name: StringName) -> void:
	if anim_name == "Coming":
		StartDialog()
