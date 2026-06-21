extends Area2D

@export var vehicleHit : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vehicleHit = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.name.contains("Vehicle"):
		vehicleHit = true


func _on_area_exited(area: Area2D) -> void:
	if area.name.contains("Vehicle"):
		vehicleHit = true
