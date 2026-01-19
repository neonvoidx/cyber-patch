extends Node2D
@onready var quick_input_puzzle: CanvasLayer = $QuickInputPuzzle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quick_input_puzzle.hide()
	restore_timer()

func restore_timer() -> void:
	var timer = $Ui/GlobalTimer/Timer
	
	if timer and GameState.saved_city_time > 0.0:
		timer.stop()
		timer.start(GameState.saved_city_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Update saved time so it continues ticking
	var timer = $Ui/GlobalTimer/Timer
	if timer:
		GameState.saved_city_time = timer.time_left
	
	if GameState.is_puzzle_showing:
		quick_input_puzzle.show()
	else:
		quick_input_puzzle.hide()
