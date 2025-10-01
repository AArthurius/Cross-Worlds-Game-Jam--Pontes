extends Document

@export var atributes: NPCID

@onready var fotoNPC: Sprite2D = $"Document Sprite/Area Foto/Foto NPC"
@onready var nome: RichTextLabel = $"Document Sprite/Dados/Nome Label"
@onready var país: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/País Label/País"
@onready var idade: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Idade Label/Idade"
@onready var emprego: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Emprego Label/Emprego"

var ownerAtributes: NPCAtributes

func _ready() -> void:
	fotoNPC.texture = atributes.npcProfileImage
	nome.text = atributes.npcName
	idade.text = str(atributes.npcAge)
	país.text = atributes.getCountryName()
	emprego.text = atributes.getWorkName()
