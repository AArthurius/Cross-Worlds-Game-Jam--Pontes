extends Area2D
class_name NPC

var atributes: NPCAtributes
@onready var animator: AnimationPlayer = $NPCAnimator
@onready var dialogBox: RichTextLabel = $"../../../UI/Dialog"
@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var documentsTable: Node2D = $"../../../DocumentsManager"

func _ready() -> void:
	sprite_2d.texture = atributes.NPCTexture
	animator.play("Coming")

func _process(delta: float) -> void:
	if documentsTable.get_child_count() == 0 && !animator.is_playing() && !dialogBox.visible:
		animator.play("Accepted")

func npc_animator_finished(anim_name: StringName) -> void:
	if anim_name == "Coming":
		dialogBox.dialog = atributes.dialog
		dialogBox.ShowMessage()
