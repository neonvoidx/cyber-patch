extends CanvasLayer
@onready var title: Label = $CenterContainer/HFlowContainer/Title
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (GameState.is_game_over):
		title.text = "Game Over"
		GameState.is_game_over = false
		title.add_theme_color_override("font_color", Colors.red)
	else:
		title.text="CyberPatch"
		title.add_theme_color_override("font_color", Colors.green)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://scenes/levels/city.tscn")
