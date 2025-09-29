extends Node2D

@onready var npcGenerator: Node2D = $"NPC Spawn Area/NPCGenerator"

var currentNPC: NPC = null
var NPCs:Array =[]

func nextNPC():
	if currentNPC == null:
		return
