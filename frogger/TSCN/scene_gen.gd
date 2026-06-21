extends Node2D

const ROAD_SCENE = preload("res://TSCN/road.tscn")
const FROG_SCENE = preload("res://TSCN/frog.tscn")
const VEHICLE_SCENE = preload("res://TSCN/vehicle.tscn")

@export var frogNode : Node2D
@export var frogXVal : float = 0.0
@export var frogYVal : float = 0.0

@export var initial_spawning : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frogXVal = 550.0
	frogYVal = 630.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if initial_spawning == false:
		_spawn_frog()
		initial_spawning = true

func _spawn_roads() -> void:
	pass

func _spawn_frog() -> void:
	var frog_instance
	frog_instance = FROG_SCENE.instantiate()
	frog_instance.global_position.x = frogXVal
	frog_instance.global_position.y = frogYVal
	add_child(frog_instance)
	frogNode = frog_instance
