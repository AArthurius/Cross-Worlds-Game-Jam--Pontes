extends RichTextLabel

@onready var showCharacter: Timer = $ShowCharacter

var dialog:Array = []

func _ready() -> void:
	print(showCharacter)
	print($ShowCharacter)

func _process(delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("AdvanceDialog"):
			ShowMessage()

func ShowMessage() -> void:
	if visible_characters != get_total_character_count() and !showCharacter.is_stopped():
		visible_characters = get_total_character_count()
		return
	if dialog.size() == 0:
		$".".visible = false
		showCharacter.stop()
		return
	visible = true
	var MSG = dialog.pop_front()
	visible_characters = 0
	text = MSG
	showCharacter.start()

func ShowCharacter() -> void:
	if visible_characters == get_total_character_count():
		showCharacter.stop()
		return
	visible_characters += 1
