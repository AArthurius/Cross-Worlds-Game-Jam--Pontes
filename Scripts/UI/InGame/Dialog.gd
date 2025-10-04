extends RichTextLabel

@onready var showCharacter: Timer = $ShowCharacter

var dialog: Array = []
var currentNPC: NPC
@onready var gameManager: Node2D = $"../.."

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
		if !GameManager.dialogCurrentMessage == "All right, go foward and cross the bridge." && !GameManager.dialogCurrentMessage == "Your documents have invalid informations. Please, back when you have valid documents.":
			gameManager.NPCShowDocuments()
		return
	visible = true
	var MSG = dialog.pop_front()
	GameManager.dialogCurrentMessage = MSG
	visible_characters = 0
	text = MSG
	showCharacter.start()

func ShowFinalDialog(dialogCanAcross: bool, npcAnimator: AnimationPlayer) -> void:
	if dialogCanAcross:
		text = "All right, go foward and cross the bridge."
		npcAnimator.play("Accepted")
	else:
		text = "Your documents have invalid informations. Please, back when you have valid documents."
		npcAnimator.play_backwards("Coming")
	visible = true
	GameManager.dialogCurrentMessage = text
	visible_characters = 0
	showCharacter.start()

func ShowCharacter() -> void:
	if visible_characters == get_total_character_count():
		showCharacter.stop()
		return
	visible_characters += 1
