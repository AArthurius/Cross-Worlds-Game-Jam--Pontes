extends Area2D
class_name Document

@export var atributes: NPCID

@onready var fotoNPC: Sprite2D = $"Document Sprite/Area Foto/Foto NPC"
@onready var nome: RichTextLabel = $"Document Sprite/Dados/Nome Label"
@onready var país: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/País Label/País"
@onready var idade: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Idade Label/Idade"
@onready var sexo: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Sexo Label/Sexo"
@onready var emprego: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Emprego Label/Emprego"
@onready var spriteCover: Sprite2D = $"Sprite Cover"

var ownerAtributes: NPCAtributes
var ownerNPC:NPC
var MouseEntered: bool = false
var isOnNPCArea: bool = false
var isDragging: bool = false
var zoomed:bool = false

func _ready() -> void:
	fotoNPC.texture = atributes.npcProfileImage
	nome.text = atributes.npcName
	idade.text = str(atributes.npcAge)
	sexo.text = atributes.getSex()
	país.text = atributes.getCountryName()
	emprego.text = atributes.getWorkName()

func _process(delta: float) -> void:
	if isDragging:
		get_parent().DragDocument($".")
		GameManager.isDraggingADocument = true
	else: 
		if position.y <= 80:
			position.y += 4
		GameManager.isDraggingADocument = false
		if isOnNPCArea and (ownerNPC.accepted or ownerNPC.denied):
			GameManager.isDraggingADocument = false
			queue_free()

func OnButtonDown() -> void:
	if !GameManager.isDraggingADocument:
		isDragging = true
		spriteCover.visible = false
		scale = Vector2(0.8,0.8)

func OnButtonUp() -> void:
	isDragging = false
	spriteCover.visible = true
	scale = Vector2(0.25, 0.25)
	position.x = get_global_mouse_position().x - 285.0

func AreaEntered(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = true

func AreaExited(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = false
