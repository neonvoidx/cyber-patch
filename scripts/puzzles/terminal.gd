extends Area2D

@onready var interact_label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interact_label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		GameState.show_puzzle()
		GameState.freeze_player()


func _on_body_entered(_body: Node2D) -> void:
	# if body entered, show label
	interact_label.show()


func _on_body_exited(_body: Node2D) -> void:
	# if body exited, hide label
	interact_label.hide()
