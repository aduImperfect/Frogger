extends Node2D

const ROAD_SCENE = preload("res://TSCN/road.tscn")
const FROG_SCENE = preload("res://TSCN/frog.tscn")
const VEHICLE_SCENE = preload("res://TSCN/vehicle.tscn")

@export var frogNode : Node2D
@export var frogXVal : float = 0.0
@export var frogYVal : float = 0.0

@export var vehiclesArr : Array[Node2D] = []
@export var vehiclesNum : int = 0

@export var infiniteXVal : float = 0.0
@export var infiniteYVal : float = 0.0

@export var xRoadCount : int = 0
@export var yRoadCount : int = 0

@export var xBeginVal : float = 0.0
@export var yBeginVal : float = 0.0
@export var xOffset : float = 0.0
@export var yOffset : float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frogXVal = 550.0
	frogYVal = 630.0
	vehiclesNum = 24
	infiniteXVal = -9999.0
	infiniteYVal = -9999.0
	xRoadCount = 6
	yRoadCount = 4
	xBeginVal = 100.0
	yBeginVal = 100.0
	xOffset = 200.0
	yOffset = 145.0
	_spawn_frog()
	_spawn_roads()
	_spawn_vehicles()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _spawn_frog() -> void:
	var frog_instance
	frog_instance = FROG_SCENE.instantiate()
	frog_instance.global_position.x = frogXVal
	frog_instance.global_position.y = frogYVal
	add_child(frog_instance)
	frogNode = frog_instance

func _spawn_roads() -> void:
	var road_instance
	for j in yRoadCount:
		for k in xRoadCount:
			road_instance = ROAD_SCENE.instantiate()
			road_instance.global_position.x = xBeginVal + (k * xOffset)
			road_instance.global_position.y = yBeginVal + (j * yOffset)
			add_child(road_instance)

func _spawn_vehicles() -> void:
	var vehicle_instance
	for k in vehiclesNum:
		vehicle_instance = VEHICLE_SCENE.instantiate()
		vehicle_instance.global_position.x = infiniteXVal
		vehicle_instance.global_position.y = infiniteXVal
		add_child(vehicle_instance)
		vehiclesArr.append(vehicle_instance)
