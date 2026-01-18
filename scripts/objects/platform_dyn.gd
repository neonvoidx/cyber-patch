extends StaticBody2D

@onready var color_rect: ColorRect = $ColorRect
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !GameState.is_puzzle_complete:
		if collision_shape:
			collision_shape.disabled = true
			if color_rect:
				color_rect.color = Colors.magenta
	else:
		if collision_shape:
			collision_shape.disabled = false
			if color_rect:
				color_rect.color = Colors.cyan
