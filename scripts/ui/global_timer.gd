extends Node

@onready var time_display: Label =  $CenterContainer/TimeDisplay
@onready var timer: Timer = $Timer
@onready var timerBar: ProgressBar = $MarginContainer/ProgressBar

func _ready() -> void:
	timer.start(GameState.initial_time)

func _process(_delta: float) -> void:
	time_display.set_text(str(timer.get_time_left()).pad_decimals(1).pad_zeros(2))
	timerBar.value = timer.time_left
	timerBar.max_value = GameState.max_timer_value
	if timer.is_stopped():
		GameState.is_game_over = true
