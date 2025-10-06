extends Node2D

@onready var points: Label = $UI/Points/Points

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"
@onready var documentsManager: Node2D = $DocumentsManager
@onready var dialogBox: RichTextLabel = $"UI/Dialog"
@onready var animator: AnimationPlayer = $"Item Interact/Animator Campainha"

const NPCScene: PackedScene = preload("uid://dj8do0uhqhcxq")
var currentNPC = null

var NPCs: Array = [preload("res://NPCs/Alien/Alien.tres"), preload("res://NPCs/Clarice Wagner Sterling/Clarice Wagner Sterling.tres"), preload("res://NPCs/Derick Frost III/Derick Frost III.tres"), preload("res://NPCs/Dona Maria Evarista/Dona Maria Evarista.tres"), preload("res://NPCs/Helena Cowboy da Silva/Helena Cowboy da Silva.tres"), preload("res://NPCs/Julian Duque Thompson/Julian Duque Thompson.tres"), preload("res://NPCs/Madeline Montello Barros/Madeline Montello Barros.tres"), preload("res://NPCs/Mary Lindovan Fischer/Mary Lindovan Fischer.tres"), preload("res://NPCs/Rose Whitmore Monroe/Rose Whitmore Monroe.tres"), preload("res://NPCs/Santiago Xavier Morais/Santiago Xavier Morais.tres")]

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
		if node.atributes.npcName == "Alien":
			NPCs.remove_at(0)
		if node.accepted && node.canAcross:
			GameManager.Points += 1
		elif node.denied && !node.canAcross:
			GameManager.Points += 1
		else:
			if GameManager.Points > 0:
				GameManager.Points -= 1
	points.text = str(GameManager.Points)

func _on_music_finished() -> void:
	$Music.play()
