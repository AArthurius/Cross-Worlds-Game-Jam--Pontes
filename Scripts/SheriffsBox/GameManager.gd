extends Node2D

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"
@onready var documentsManager: Node2D = $DocumentsManager
@onready var dialogBox: RichTextLabel = $"UI/Dialog"

const NPCScene: PackedScene = preload("uid://dj8do0uhqhcxq")

var NPCs: Array = [preload("uid://eqietaws314b"), preload("uid://bv7qp4ik0rxp4"), preload("uid://djb0dasiq3tyn"),preload("uid://bsmdlqgnjug86"), preload("uid://cr4yydj1rh0uw"), preload("uid://bpp0t332yfokm"), preload("uid://v0pkxb3o2s6e")]

func nextNPC():
	if npcGenerator.get_child_count() > 0:
		return

	var character = NPCScene.instantiate()
	character.atributes = NPCs[randi_range(0, NPCs.size() - 1)].duplicate(true)
	dialogBox.currentNPC = character
	npcGenerator.add_child(character)

func NPCShowDocuments():
	var documents: Array = dialogBox.currentNPC.atributes.documents
	for doc in documents:
		var document = doc.instantiate()
		documentsManager.add_child(document)
