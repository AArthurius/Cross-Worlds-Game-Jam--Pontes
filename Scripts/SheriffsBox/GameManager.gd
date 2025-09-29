extends Node2D

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"
@onready var documentsManager: Node2D = $DocumentsManager

const NPCScene:PackedScene = preload("uid://dj8do0uhqhcxq")

var currentNPC: NPC = null
var NPCs:Array =[preload("uid://eqietaws314b")]

func nextNPC():
	if NPCs.size() <= 0:
		return
	if currentNPC != null:
		return
	
	var character = NPCScene.instantiate()
	character.atributes = NPCs.pop_front()
	currentNPC = character
	npcGenerator.add_child(character)

func NPCShowDocuments():
	var documents:Array = currentNPC.atributes.documents
	for doc in documents:
		var document = doc.instantiate()
		documentsManager.add_child(document)
	
