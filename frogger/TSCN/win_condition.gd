extends Node2D

@export var playerMovementNode : Node2D
@export var youWinText : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if playerMovementNode.gameWon == true:
		_zoder_win_text()
	elif playerMovementNode.gameWon == false:
		_zoder_not_win()

func _zoder_win_text() -> void:
	youWinText.z_index = 20

func _zoder_not_win() -> void:
	youWinText.z_index = -20
