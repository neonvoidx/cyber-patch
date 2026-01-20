extends CanvasLayer
@onready var title: Label = $CenterContainer/HFlowContainer/Title
@onready var title2: Label = $CenterContainer/HFlowContainer/Title2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (GameState.is_game_over):
		title.text = "Game Over"
		GameState.is_game_over = false
		title.add_theme_color_override("font_color", Colors.red)
		title2.show()
	elif (GameState.is_won):
		title2.text = "You Won! Play again?"
		title2.show()
	else:
		title.text="CyberPatch"
		title.add_theme_color_override("font_color", Colors.cyan)
		title2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file(GameState.level_map[GameState.level])
