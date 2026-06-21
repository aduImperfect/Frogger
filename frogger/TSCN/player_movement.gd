extends Node2D

@export var sceneGen : Node2D

@export var frogVertSpeed : float = 0.0
@export var frogSpeedVertAdditive : float = 0.0

@export var frogHorizSpeed : float = 0.0

@export var xPath : int = 0
@export var yLane : int = 0

@export var xMoveLimit : int = 0
@export var yMoveLimit : int = 0

@export var gameDone : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frogVertSpeed = 95.0
	frogSpeedVertAdditive = 50.0
	frogHorizSpeed = 50.0
	xPath = 0
	yLane = -1
	xMoveLimit = 10
	yMoveLimit = 4
	gameDone = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#Frogger reached goal!
	if yLane == yMoveLimit:
		gameDone = true

	if gameDone == false:
		_input_management(_delta)

func _input_management(_delta : float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		_move_character("up")
	elif Input.is_action_just_pressed("ui_down"):
		_move_character("down")
	elif Input.is_action_just_pressed("ui_left"):
		_move_character("left")
	elif Input.is_action_just_pressed("ui_right"):
		_move_character("right")

func _move_character(_movementStr : String) -> void:
	if _movementStr == "up":
		if yLane >= 0 && yLane < (yMoveLimit - 1):
			sceneGen.frogNode.position.y -= frogSpeedVertAdditive
		elif yLane == yMoveLimit:
			print(sceneGen.frogNode.position)
			return
		sceneGen.frogNode.position.y -= frogVertSpeed
		yLane += 1
	elif _movementStr == "down":
		if yLane == -1:
			print(sceneGen.frogNode.position)
			return
		elif yLane > 0 && yLane <= 3:
			sceneGen.frogNode.position.y += frogSpeedVertAdditive
		sceneGen.frogNode.position.y += frogVertSpeed
		yLane -= 1
	elif _movementStr == "left":
		if xPath == -xMoveLimit:
			print(sceneGen.frogNode.position)
			return
		sceneGen.frogNode.position.x -= frogHorizSpeed
		xPath -= 1
	elif _movementStr == "right":
		if xPath == xMoveLimit:
			print(sceneGen.frogNode.position)
			return
		sceneGen.frogNode.position.x += frogHorizSpeed
		xPath += 1

	print(sceneGen.frogNode.position)
