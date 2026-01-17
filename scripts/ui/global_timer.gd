extends Control

@onready var time_display: Label =  $TimeDisplay
@onready var timer: Timer = $Timer

@export var initial_time = 20.0

func _ready() -> void:
	timer.start(initial_time)

func _process(delta: float) -> void:
	time_display.set_text(str(timer.get_time_left()).pad_decimals(2).pad_zeros(2))
	if timer.is_stopped():
		GameState.is_game_over = true
