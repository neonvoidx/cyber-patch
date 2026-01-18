extends Node2D

func _ready() -> void:
	if GameState.is_puzzle_complete:
		restore_player_state()

func restore_player_state() -> void:
	var player = $Player
	var timer = $Ui/GlobalTimer/Timer
	
	if player and GameState.saved_city_position != Vector2.ZERO:
		player.global_position = GameState.saved_city_position
	
	if timer and GameState.saved_city_time > 0.0:
		timer.stop()
		timer.start(GameState.saved_city_time)
