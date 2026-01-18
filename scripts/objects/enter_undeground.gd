extends Area2D
@onready var color_rect: ColorRect = $ColorRect
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GameState.is_puzzle_complete:
		color_rect.color = Colors.dark_blue
		collision_shape.disabled = true
