extends Node2D

@export var sceneGen : Node2D
@export var camera : Camera2D

@export var frogVertSpeed : float = 0.0
@export var frogSpeedVertAdditive : float = 0.0

@export var frogHorizSpeed : float = 0.0

@export var xPath : int = 0
@export var yLane : int = 0

@export var xMoveLimit : int = 0
@export var yMoveLimit : int = 0

@export var yMoveCamUpSwitchLimit : int = 0
@export var yMoveCamDownSwitchLimit : int = 0

@export var yUpCamPosX : float = 0
@export var yDownCamPosX : float = 0

@export var gameWon : bool = false
@export var gameLost : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frogVertSpeed = 95.0
	frogSpeedVertAdditive = 50.0
	frogHorizSpeed = 50.0
	xPath = 0
	yLane = -1
	xMoveLimit = 10
	yMoveLimit = 10
	yMoveCamUpSwitchLimit = 5
	yMoveCamDownSwitchLimit = 4
	gameWon = false
	gameLost = false
	yUpCamPosX = -395.0
	yDownCamPosX = 325.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#Frogger reached goal!
	if yLane == yMoveLimit:
		gameWon = true

	if gameWon == false && gameLost == false:
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
#------------------------
		if yLane == (yMoveCamUpSwitchLimit - 1):
			camera.global_position.y = yUpCamPosX
			print("Cam Up Switch")
#------------------------
		if (yLane >= 0) && (yLane < (yMoveCamUpSwitchLimit - 2)):
			sceneGen.frogNode.position.y -= frogSpeedVertAdditive
		elif (yLane > yMoveCamUpSwitchLimit) && (yLane < yMoveLimit - 1):
			sceneGen.frogNode.position.y -= frogSpeedVertAdditive
		elif yLane == yMoveLimit:
			return
		sceneGen.frogNode.position.y -= frogVertSpeed
		yLane += 1
	elif _movementStr == "down":
#------------------------
		if yLane == (yMoveCamDownSwitchLimit + 1):
			camera.global_position.y = yDownCamPosX
			print("Cam Down Switch")
#------------------------
		if yLane == -1:
			return
		elif (yLane > 0) && (yLane <= (yMoveCamDownSwitchLimit - 1)):
			sceneGen.frogNode.position.y += frogSpeedVertAdditive
		elif (yLane > yMoveCamDownSwitchLimit + 2) && (yLane < yMoveLimit):
			sceneGen.frogNode.position.y += frogSpeedVertAdditive
		sceneGen.frogNode.position.y += frogVertSpeed
		yLane -= 1
#------------------------
	elif _movementStr == "left":
		if xPath == -xMoveLimit:
			return
		sceneGen.frogNode.position.x -= frogHorizSpeed
		xPath -= 1
	elif _movementStr == "right":
		if xPath == xMoveLimit:
			return
		sceneGen.frogNode.position.x += frogHorizSpeed
		xPath += 1
#------------------------

	print(xPath)
	print(yLane)
	print(sceneGen.frogNode.position)
