extends Node2D

var Dialog: Array

func _process(delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("AdvanceDialog"):
			ShowMessage()

func ShowMessage() -> void:
	if $Text.visible_characters != $Text.get_total_character_count():
		$Text.visible_characters = $Text.get_total_character_count()
		return
	if Dialog.size() == 0:
		$".".visible = false
		return
	visible = true
	var MSG = Dialog.pop_front()
	$Text.visible_characters = 0
	$Text.text = MSG
	$ShowCharacter.start()

func ShowCharacter() -> void:
	if $Text.visible_characters == $Text.get_total_character_count():
		return
	$Text.visible_characters += 1
	$ShowCharacter.start()
