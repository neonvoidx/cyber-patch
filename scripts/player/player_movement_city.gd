extends CharacterBody2D

@onready var jump_buffer_timer: Timer = $JumpBufferTimer
@onready var coyote_timer: Timer = $CoyoteTimer

var speed = 500.0
var jump_speed = -80.0 * 7.5
var acceleration = 20.0
var gravity = 160.0 * 6.0
var down_gravity_factor = 1.5
var sprint_multiplier = 1.2

enum State{IDLE, WALK, JUMP, DOWN}
var current_state: State = State.IDLE

func _physics_process(delta: float) -> void:
	handle_input()
	update_movement(delta)
	update_state()
	#update_animations()
	move_and_slide()
	
func handle_input() -> void:
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer.start()
	
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	else:
		velocity.x = move_toward(velocity.x, speed * direction, acceleration)
		#if Input.is_action_pressed("sprint"):
			#velocity.x *= sprint_multiplier
	
func update_movement(delta: float) -> void:
	if (is_on_floor() || coyote_timer.time_left > 0) && jump_buffer_timer.time_left > 0:
		velocity.y = jump_speed
		current_state = State.JUMP
		jump_buffer_timer.stop()
		coyote_timer.stop()	
	
	if current_state == State.JUMP:
		velocity.y += gravity * delta
	else:
		velocity.y += gravity * down_gravity_factor * delta

func update_state():
	match current_state:
		State.IDLE when velocity.x != 0:
			current_state = State.WALK
		State.WALK:
			if velocity.x == 0:
				current_state = State.IDLE
			if not is_on_floor() && velocity.y > 0:
				current_state = State.DOWN
				coyote_timer.start()
		State.JUMP when velocity.y > 0:
			current_state = State.DOWN
		State.DOWN when is_on_floor():
			if velocity.x == 0:
				current_state = State.IDLE
			else:
				current_state = State.WALK
				
#func update_animation() -> void:
	#if velocity.x != 0:
		#animations.scale.x = sign(velocity.x)
	#match current_state:
		#State.IDLE: animations.play("idle")
		#State.WALK: animations.play("walk")
		#State.JUMP: animations.play("jump_up")
		#State.DOWN: animations.play("jump_down")


func _on_area_2d_body_entered(_body: Node2D) -> void:
	GameState.complete_level()
