extends Area2D
class_name Document

@export var atributes: NPCID

@onready var fotoNPC: Sprite2D = $"Document Sprite/Area Foto/Foto NPC"
@onready var nome: RichTextLabel = $"Document Sprite/Dados/Nome Label"
@onready var país: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/País Label/País"
@onready var idade: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Idade Label/Idade"
@onready var emprego: RichTextLabel = $"Document Sprite/Dados/VBoxContainer/Emprego Label/Emprego"
@onready var Animator: AnimationPlayer = $Animator

var ownerAtributes: NPCAtributes

var MouseEntered: bool = false
var isOnNPCArea: bool = false
var isDragging: bool = false

func _ready() -> void:
	fotoNPC.texture = atributes.npcProfileImage
	nome.text = atributes.npcName
	idade.text = str(atributes.npcAge)
	país.text = atributes.getCountryName()
	emprego.text = atributes.getWorkName()
	Animator.play("Drop")

func _process(delta: float) -> void:
	if isDragging:
		get_parent().DragDocument($".")
		GameManager.isDraggingADocument = true
	else: 
		GameManager.isDraggingADocument = false
		if isOnNPCArea && !Animator.is_playing() && !isDragging:
			GameManager.isDraggingADocument = false
			queue_free()

func OnButtonDown() -> void:
	if !GameManager.isDraggingADocument:
		isDragging = true

func OnButtonUp() -> void:
	isDragging = false

func AreaEntered(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = true

func AreaExited(area: Area2D) -> void:
	if area.is_in_group("NPC"):
		isOnNPCArea = false
