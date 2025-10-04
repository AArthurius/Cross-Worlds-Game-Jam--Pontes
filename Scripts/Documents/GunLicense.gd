extends Area2D
class_name WeaponLicense

@export var atributes: GunLicense

@onready var fotoArma: Sprite2D = $"Area Foto/Foto Arma"
@onready var nomeArma: RichTextLabel = $"Dados/Nome arma"
@onready var validade: RichTextLabel = $"Dados/VBoxContainer/Validade Label/Validade"
@onready var tipo: RichTextLabel = $"Dados/VBoxContainer/Tipo Label/Tipo"
@onready var number: RichTextLabel = $"Dados/VBoxContainer/Number Label/Number"
@onready var bearerNacionality: RichTextLabel = $"Dados/VBoxContainer/Bearer Nacionality Label/Bearer Nacionality"

@onready var spriteCover: Sprite2D = $"Sprite Cover"

var ownerNPC: NPC
var MouseEntered: bool = false
var isOnNPCArea: bool = false
var isDragging: bool = false
var zoomed:bool = false

func _process(delta: float) -> void:
	if isDragging:
		get_parent().DragDocument($".")
		GameManager.isDraggingADocument = true
	else: 
		if position.y <= 80:
			position.y += 4
		GameManager.isDraggingADocument = false
		if isOnNPCArea and (GameManager.currentNPC.accepted or GameManager.currentNPC.denied):
			GameManager.isDraggingADocument = false
			queue_free()

func assignAtributes() -> void:
	$"Area Foto/Foto Arma".texture = atributes.Sprite
	$"Dados/Nome arma".text = atributes.GunName
	$"Dados/VBoxContainer/Validade Label/Validade".text = atributes.Validaty
	$"Dados/VBoxContainer/Tipo Label/Tipo".text = atributes.getWeaponType()
	$"Dados/VBoxContainer/Number Label/Number".text = atributes.Number
	$"Dados/VBoxContainer/Bearer Nacionality Label/Bearer Nacionality".text = atributes.getCountryName()

func OnButtonDown() -> void:
	if !GameManager.isDraggingADocument:
		isDragging = true
		spriteCover.visible = false
		scale = Vector2(0.8,0.8)
		$CollisionShape2D.scale = Vector2(0.25, 0.25)

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
