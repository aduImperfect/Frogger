extends Node2D

@export var sceneGen : Node2D

@export var xHiddenVal : float = 0.0
@export var yHiddenVal : float = 0.0
@export var xResetHiddenVal : float = 0.0

@export var xLimit : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xHiddenVal = -500.0
	yHiddenVal = 100.0
	xLimit = 1200.0
	xResetHiddenVal = -50.0
	_repositioning_vehicles()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_move_vehicles(_delta)
	_reset_positioning()

func _repositioning_vehicles() -> void:
	for j in sceneGen.yVehiclesCount:
		for k in sceneGen.xVehiclesCount:
			sceneGen.vehiclesArr[k + (j * sceneGen.yVehiclesCount)].position.x = xHiddenVal + (k * sceneGen.xOffset)
			sceneGen.vehiclesArr[k + (j * sceneGen.yVehiclesCount)].position.y = yHiddenVal + (j * sceneGen.yOffset)

func _move_vehicles(_delta : float) -> void:
	var minSpeed : float = 25.0
	var maxSpeed : float = 100.0
	var moveSpeed : float = 0.0
	for j in sceneGen.yVehiclesCount:
		for k in sceneGen.xVehiclesCount:
			var newMoveSpeed = randf_range(minSpeed + ((sceneGen.yVehiclesCount - j) * minSpeed), maxSpeed + ((sceneGen.yVehiclesCount - j) * maxSpeed))
			moveSpeed = newMoveSpeed
			sceneGen.vehiclesArr[k + (j * sceneGen.yVehiclesCount)].position.x += (moveSpeed * _delta)

func _reset_positioning() -> void:
	for j in sceneGen.yVehiclesCount:
		for k in sceneGen.xVehiclesCount:
			if sceneGen.vehiclesArr[k + (j * sceneGen.yVehiclesCount)].position.x > xLimit:
				sceneGen.vehiclesArr[k + (j * sceneGen.yVehiclesCount)].position.x = xResetHiddenVal
