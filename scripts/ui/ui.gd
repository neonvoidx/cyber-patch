extends CanvasLayer

@onready var time_bonus_indicator: Label = $TimeBonusIndicator

func _ready() -> void:
	GameState.time_bonus_added.connect(_on_time_bonus_added)
	# Check if we should show time bonus from previous scene
	if GameState.show_time_bonus:
		GameState.show_time_bonus = false
		# Delay slightly to ensure UI is fully loaded
		await get_tree().create_timer(0.1).timeout
		_on_time_bonus_added(GameState.time_bonus_amount)

func _on_time_bonus_added(seconds: float) -> void:
	if time_bonus_indicator:
		time_bonus_indicator.show_bonus(seconds)
