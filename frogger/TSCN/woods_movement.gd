extends Node2D

@export var sceneGen : Node2D
@export var collisionMgr : Node2D

@export var xHiddenVal : float = 0.0
@export var yHiddenVal : float = 0.0
@export var xResetHiddenVal : float = 0.0

@export var xUpperLimit : float = 0.0
@export var xLowerLimit : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xHiddenVal = -100.0
	yHiddenVal = -625.0
	xUpperLimit = 1200.0
	xLowerLimit = -50.0
	xResetHiddenVal = -50.0
	_repositioning_woods()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_move_woods(_delta)
	_reset_positioning_woods()

func _repositioning_woods() -> void:
	for j in sceneGen.yWoodsCount:
		for k in sceneGen.xWoodsCount:
			if j % 2 == 0:
				sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x = xHiddenVal + (k * sceneGen.xOffset)
			else:
				sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x = (xUpperLimit - xHiddenVal) + (k * sceneGen.xOffset)
			sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.y = yHiddenVal + (j * sceneGen.yOffset)

func _move_woods(_delta : float) -> void:
	var minSpeed : float = 25.0
	var maxSpeed : float = 100.0
	var moveSpeed : float = 0.0
	for j in sceneGen.yWoodsCount:
		for k in sceneGen.xWoodsCount:
			var newMoveSpeed = randf_range(minSpeed + ((sceneGen.yWoodsCount - j) * minSpeed), maxSpeed + ((sceneGen.yWoodsCount - j) * maxSpeed))
			moveSpeed = newMoveSpeed
			if j % 2 == 0:
				sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x += (moveSpeed * _delta)
			else:
				sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x -= (moveSpeed * _delta)

func _reset_positioning_woods() -> void:
	for j in sceneGen.yWoodsCount:
		for k in sceneGen.xWoodsCount:
			if sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x > xUpperLimit:
				if j % 2 == 0:
					sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x = xResetHiddenVal
			elif sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x < xLowerLimit:
				if j % 2 != 0:
					sceneGen.woodsArr[k + (j * sceneGen.yWoodsCount)].position.x = (xUpperLimit - xResetHiddenVal)
