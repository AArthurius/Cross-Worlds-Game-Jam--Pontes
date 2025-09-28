extends Area2D
class_name NPC

@export var atributes: NPCAtributes
@onready var Animator = $NPCAnimator as AnimationPlayer
@onready var dialogBox: RichTextLabel = $"../../UI/Dialog"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Animator.play("Comming")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../../DocumentsManager".get_child_count() == 0 && !Animator.is_playing() && !dialogBox.visible:
		Animator.play("Exiting")
	
func StartDialog():
	dialogBox.dialog = atributes.dialog
	dialogBox.visible = true
	dialogBox.ShowMessage()
	dialogBox.currentNPC = $"."

func DropDocuments():
	for documents in atributes.documents:
		var documentPath = load(documents.get_path())
		var document = documentPath.instantiate()
		$"../../DocumentsManager".add_child(document)
