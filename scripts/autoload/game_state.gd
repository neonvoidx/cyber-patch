extends Node
# Game State
const MAX_LEVEL = 2
var is_game_over: bool
var max_timer_value = 20.0
var initial_time = 20.0
var is_won = false
var level = 1
var level_complete = false
var is_paused = false
var is_puzzle_complete = false
var is_underground = false
var is_puzzle_showing = false
var is_player_movable = true
var show_time_bonus = false
var time_bonus_amount = 0.0
var level_map = {1: "res://scenes/levels/city1.tscn", 2: "res://scenes/levels/city2.tscn"}
var undeground_map = {1: "res://scenes/levels/underground.tscn", 2: "res://scenes/levels/underground2.tscn"}

# Saved state for underground transitions
var saved_city_position: Vector2 = Vector2.ZERO
var saved_city_time: float = 0.0

func _process(_delta: float) -> void:
	if is_game_over:
		game_over.emit()
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func freeze_player():
	is_player_movable=false
func unfreeze_player():
	is_player_movable=true
	
func complete_level() -> void:
	level += 1
	change_map()
	reset_level()

func enter_undergound(player_position: Vector2 = Vector2.ZERO, time_left: float = 0.0) -> void:
	is_underground=true
	saved_city_position = player_position
	saved_city_time = time_left
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/underground.tscn")

func leave_underground():
	is_underground=false
	is_puzzle_complete = true
	# Add 5 second bonus to timer
	var bonus = 5.0
	saved_city_time = min(saved_city_time + bonus, max_timer_value)
	# Flag to show bonus when scene loads
	show_time_bonus = true
	time_bonus_amount = bonus
	time_bonus_added.emit(bonus)
	get_tree().change_scene_to_file(level_map[level])
	
func pause() -> void:
	is_paused = true
	get_tree().paused = true
	
func unpause() -> void:
	is_paused = false
	get_tree().paused = false

func show_puzzle():
	is_puzzle_showing = true

func hide_puzzle():
	is_puzzle_showing = false
	
func reset_level():
	is_puzzle_complete = false
	is_puzzle_showing = false
	is_player_movable = true
	is_game_over = false
	is_underground =false
	level_complete=false
		

func change_map():
	if level > MAX_LEVEL:
		is_won=true
		level = 1
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")	
	else:
		get_tree().change_scene_to_file(level_map[level])
	
# Signals emitted
signal game_over
signal time_bonus_added(seconds: float)
