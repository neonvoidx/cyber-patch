extends Label

func _ready() -> void:
	modulate = Color(1, 1, 1, 0)
	hide()

func show_bonus(seconds: float) -> void:
	text = "+%.0fs" % seconds
	show()
	# Flash in quickly
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "modulate:a", 1.0, 0.2)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.2)
	# Hold for a moment
	tween.chain().tween_interval(0.8)
	# Fade out and scale down
	tween.chain().set_parallel(true)
	tween.tween_property(self, "modulate:a", 0.0, 1.5)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 1.5)
	tween.chain().tween_callback(hide)
