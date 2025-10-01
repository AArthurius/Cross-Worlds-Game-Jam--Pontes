extends Node2D

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"
@onready var documentsManager: Node2D = $DocumentsManager
@onready var dialogBox: RichTextLabel = $"UI/Dialog"
@onready var animator: AnimationPlayer = $Campainha/Animator

const NPCScene: PackedScene = preload("uid://dj8do0uhqhcxq")
var currentNPC = null

var NPCs: Array = [preload("uid://eqietaws314b"), preload("uid://bv7qp4ik0rxp4"), preload("uid://djb0dasiq3tyn"),preload("uid://bsmdlqgnjug86"), preload("uid://cr4yydj1rh0uw"), preload("uid://bpp0t332yfokm"), preload("uid://v0pkxb3o2s6e")]

func nextNPC():
	animator.play("Campainha")
	if npcGenerator.get_child_count() > 0:
		return

	var character = NPCScene.instantiate()
	character.atributes = NPCs[randi_range(0, NPCs.size() - 1)].duplicate(true)
	dialogBox.currentNPC = character
	npcGenerator.add_child(character)
	currentNPC = character

func NPCShowDocuments():
	var documents: Array = currentNPC.atributes.documents
	for doc in documents:
		var docInst = doc.instantiate()
		if docInst.atributes is NPCID:
			docInst.atributes.assignAtributes(currentNPC.atributes)
		documentsManager.add_child(docInst)
