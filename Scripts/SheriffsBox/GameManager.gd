extends Node2D

@onready var points: Label = $UI/Points/Points

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"
@onready var documentsManager: Node2D = $DocumentsManager
@onready var dialogBox: RichTextLabel = $"UI/Dialog"
@onready var animator: AnimationPlayer = $"Item Interact/Animator Campainha"

const NPCScene: PackedScene = preload("uid://dj8do0uhqhcxq")
var currentNPC = null

var NPCs: Array = [preload("uid://eqietaws314b"), preload("uid://bv7qp4ik0rxp4"), preload("uid://djb0dasiq3tyn"),preload("uid://bsmdlqgnjug86"), preload("uid://cr4yydj1rh0uw"), preload("uid://bpp0t332yfokm"), preload("uid://v0pkxb3o2s6e"), preload("uid://cx7pltt4xjmvy"), preload("uid://bx0xovq7rnkmf"), preload("uid://jmc1um56q2w")]

func nextNPC():
	animator.play("Campainha")
	if npcGenerator.get_child_count() > 0:
		return

	var character = NPCScene.instantiate()
	character.atributes = NPCs[randi_range(0, NPCs.size() - 1)].duplicate(true)
	dialogBox.currentNPC = character
	character.canAcross = true if randi_range(0, 1) == 0 else false
	npcGenerator.add_child(character)
	currentNPC = character
	GameManager.currentNPC = currentNPC

func NPCShowDocuments():
	var documents: Array = currentNPC.atributes.documents
	for doc in documents:
		var docInst = doc.instantiate()
		if docInst.atributes is NPCID:
			docInst.atributes.assignAtributes(currentNPC.atributes, currentNPC.canAcross)
			docInst.ownerNPC = currentNPC
		if docInst is WeaponLicense:
			docInst.atributes = load("res://NPCs/" + currentNPC.atributes.npcName + "/GunLicense.tres")
			docInst.assignAtributes()
		currentNPC.free = true
		documentsManager.add_child(docInst)
		documentsManager.dropDocument(docInst)

func NPCExited(node: Node) -> void:
	if node is NPC:
		if node.atributes.npcName != "Alien":
			if node.accepted && node.canAcross:
				GameManager.Points += 1
			elif node.denied && !node.canAcross:
				GameManager.Points += 1
			else:
				if GameManager.Points > 0:
					GameManager.Points -= 1
		else: NPCs.remove_at(7)
	points.text = str(GameManager.Points)
