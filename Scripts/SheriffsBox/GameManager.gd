extends Node2D

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"
@onready var documentsManager: Node2D = $DocumentsManager
@onready var dialogBox: RichTextLabel = $"UI/Dialog"
@onready var animator: AnimationPlayer = $Campainha/Animator

const NPCScene: PackedScene = preload("uid://dj8do0uhqhcxq")

var currentNPC: NPC = null
var NPCs: Array = [preload("uid://eqietaws314b"), preload("uid://bv7qp4ik0rxp4"), preload("uid://djb0dasiq3tyn"),preload("uid://bsmdlqgnjug86")]

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
		var document = doc.instantiate()
		if doc.atributes is NPCID:
			doc.npcprofileImage = currentNPC.NPCTexture
			doc.npcName = currentNPC.npcName
			doc.npcAge = currentNPC.npcAge
			doc.npcCountry = currentNPC.npcCountry
			doc.npcCitadelWork = currentNPC.npcCitadelWork
		documentsManager.add_child(document)
