extends item

var approved: bool = false
var denied:bool = false
var isOnNPCArea:bool = false


func _process(delta: float) -> void:
	dragManager()
