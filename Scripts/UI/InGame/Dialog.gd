extends RichTextLabel

@onready var showCharacter: Timer = $ShowCharacter

var dialog: Array = []
var currentNPC: Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("AdvanceDialog"):
			ShowMessage()

func ShowMessage() -> void:
	if visible_characters != get_total_character_count() && get_total_character_count() > 0:
		visible_characters = get_total_character_count()
		return
	if dialog.size() == 0:
		$".".visible = false
		showCharacter.stop()
		return
	visible = true
	var MSG = dialog.pop_front()
	GameManager.dialogCurrentMessage = MSG
	visible_characters = 0
	text = MSG
	showCharacter.start()
	
	if MSG == "Here are my documents.":
		currentNPC.DropDocuments()

func ShowCharacter() -> void:
	if visible_characters == get_total_character_count():
		showCharacter.stop()
		return
	visible_characters += 1
