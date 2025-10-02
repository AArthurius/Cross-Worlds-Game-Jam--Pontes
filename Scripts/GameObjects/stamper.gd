extends item

@onready var marker2D: Marker2D = $Marker2D

@export var approveStamp:bool = false

const APPROVED_STAMP = preload("uid://crkj8vaddtddc")
const DENIED_STAMP = preload("uid://dog5rtu1myxc2")

var citadelPass:item

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset = marker2D.position
	dragManager()
	if !isDragging:
		queue_free()
	if Input.is_action_just_pressed("UseItem"):
		useItem()

func useItem():
	isDragging = false
	if citadelPass != null:
		var stampPos:Vector2 = citadelPass.to_local(marker2D.global_position)
		var stampTexture:Sprite2D = Sprite2D.new()
		if approveStamp:
			stampTexture.texture = APPROVED_STAMP
			citadelPass.approved = true
		else:
			stampTexture.texture = DENIED_STAMP
			citadelPass.denied = true
		stampTexture.position = stampPos
		citadelPass.get_child(0).add_child(stampTexture)
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is item:
		if area.is_in_group("pass"):
			citadelPass = area


func _on_area_exited(area: Area2D) -> void:
	if area is item:
		if area.is_in_group("pass"):
			citadelPass = null
