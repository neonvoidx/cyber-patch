extends CharacterBody2D

var speed = 500.0
var sprint_multiplier = 1.2

enum State{IDLE_DOWN, IDLE_UP, IDLE_LEFT, IDLE_RIGHT, UP, DOWN, LEFT, RIGHT}
var current_state: State = State.IDLE_DOWN
var last_direction: Vector2 = Vector2.DOWN

func _physics_process(_delta: float) -> void:
	handle_input()
	update_state()
	#update_animations()
	move_and_slide()
	
func handle_input() -> void:
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		input_direction.y -= 1
	if Input.is_action_pressed("down"):
		input_direction.y += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()
		last_direction = input_direction
	
	velocity = input_direction * speed

func update_state():
	if velocity == Vector2.ZERO:
		# Set idle state based on last direction
		if abs(last_direction.y) > abs(last_direction.x):
			if last_direction.y < 0:
				current_state = State.IDLE_UP
			else:
				current_state = State.IDLE_DOWN
		else:
			if last_direction.x < 0:
				current_state = State.IDLE_LEFT
			else:
				current_state = State.IDLE_RIGHT
	else:
		# Set moving state based on current velocity
		if abs(velocity.y) > abs(velocity.x):
			if velocity.y < 0:
				current_state = State.UP
			else:
				current_state = State.DOWN
		else:
			if velocity.x < 0:
				current_state = State.LEFT
			else:
				current_state = State.RIGHT
				
#func update_animation() -> void:
	#match current_state:
		#State.IDLE_DOWN: animations.play("idle_down")
		#State.IDLE_UP: animations.play("idle_up")
		#State.IDLE_LEFT: animations.play("idle_left")
		#State.IDLE_RIGHT: animations.play("idle_right")
		#State.UP: animations.play("walk_up")
		#State.DOWN: animations.play("walk_down")
		#State.LEFT: animations.play("walk_left")
		#State.RIGHT: animations.play("walk_right")
