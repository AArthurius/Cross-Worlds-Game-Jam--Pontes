extends Area2D
class_name NPC

@onready var animator: AnimationPlayer = $NPCAnimator
@onready var dialogBox: RichTextLabel = $"../../../UI/Dialog"
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var documentsTable: Node2D = $"../../../DocumentsManager"
@onready var spriteChapeu: Sprite2D = $"Sprite2D/Sprite Chapeu"
var atributes: NPCAtributes

func _ready() -> void:
	sprite_2d.texture = atributes.NPCTexture
	var chapeuRand = randi_range(0, 100)
	if chapeuRand < 40:
		spriteChapeu.visible = true
	
	animator.play("Coming")

func _process(delta: float) -> void:
	if documentsTable.get_child_count() == 0 && !animator.is_playing() && !dialogBox.visible:
		animator.play("Accepted")

func npc_animator_finished(anim_name: StringName) -> void:
	if anim_name == "Coming":
		dialogBox.dialog = atributes.dialog
		dialogBox.ShowMessage()
