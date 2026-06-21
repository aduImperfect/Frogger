extends Node2D

@export var sceneGen : Node2D
@export var playerMovement: Node2D
@export var youLoseText: TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if playerMovement.gameLost == false:
		_collision_checks()

	if playerMovement.gameLost == true:
		playerMovement.gameWon = false
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

	if (playerMovement.yLane > playerMovement.yMoveCamUpSwitchLimit) && (playerMovement.yLane < playerMovement.yMoveLimit):
		var _sittingOnAWood : bool = false

		for k in sceneGen.woodsNum:
			var woodArea2D : Area2D = sceneGen.woodsArr[k].get_child(0).get_child(0)
			if (woodArea2D.frogSitting == true) && (frogArea2D.woodCarrier == true):
				_sittingOnAWood = true
				print("Frog Sitting On Wood!")
				sceneGen.frogNode.position.x = sceneGen.woodsArr[k].position.x
				break
			else:
				_sittingOnAWood = false

		#if _sittingOnAWood == false:
			#print("Frog On Water!")
			#playerMovement.gameLost = true
			#return

	if (sceneGen.frogNode.position.x < 20.0):
		print("Out Of Bounds")
		playerMovement.gameLost = true
		return

	if (sceneGen.frogNode.position.x > 1150.0):
		print("Out Of Bounds")
		playerMovement.gameLost = true
		return

func _zoder_lose_text() -> void:
	youLoseText.z_index = 20
