extends Node2D

@export var sceneGen : Node2D
@export var playerMovement: Node2D
@export var youLoseText: TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if playerMovement.gameLost == false:
		_collision_checks()

	if playerMovement.gameLost == true:
		_zoder_lose_text()

func _collision_checks() -> void:
	#pass
	var frogArea2D : Area2D = sceneGen.frogNode.get_child(0).get_child(0)
	if frogArea2D.vehicleHit == true:
		print("Vehicle Hit!")
		playerMovement.gameLost = true

	for k in sceneGen.vehiclesNum:
		var vehicleArea2D : Area2D = sceneGen.vehiclesArr[k].get_child(0).get_child(0)
		if vehicleArea2D.frogHit == true:
			print("Frog Hit!")
			playerMovement.gameLost = true
			break

func _zoder_lose_text() -> void:
	youLoseText.z_index = 20
