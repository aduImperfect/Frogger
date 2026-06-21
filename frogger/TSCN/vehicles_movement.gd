extends Node2D

@export var sceneGen : Node2D

@export var xHiddenVal : float = 0.0
@export var yHiddenVal : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xHiddenVal = -50.0
	yHiddenVal = 100.0
	_repositioning_vehicles()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _repositioning_vehicles() -> void:
	for j in sceneGen.yRoadCount:
		for k in sceneGen.xRoadCount:
			sceneGen.vehiclesArr[k + (j * sceneGen.yRoadCount)].position.x = xHiddenVal
			sceneGen.vehiclesArr[k + (j * sceneGen.yRoadCount)].position.y = yHiddenVal + (j * sceneGen.yOffset)
