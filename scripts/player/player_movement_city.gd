extends CharacterBody2D

@onready var jump_buffer_timer: Timer = $JumpBufferTimer
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var speed = 300.0
var jump_speed = -80.0 * 6.5
var acceleration = 20.0
var gravity = 160.0 * 6.0
var down_gravity_factor = 1.5
var sprint_multiplier = 1.2

enum State{IDLE, RUN, JUMP, DOWN}
var current_state: State = State.IDLE
var facing_left: bool = false

func _ready():
	animated_sprite.play("idle_right")
	
func _physics_process(delta: float) -> void:
	handle_input()
	update_movement(delta)
	update_state()
	update_animation()
	move_and_slide()
	
func handle_input() -> void:
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer.start()
	
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	else:
		velocity.x = move_toward(velocity.x, speed * direction, acceleration)
		if direction < 0:
			facing_left = true
		elif direction > 0:
			facing_left = false
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
			current_state = State.RUN
		State.RUN:
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
				current_state = State.RUN
				
func update_animation() -> void:
	var direction_suffix = "_left" if facing_left else "_right"
	
	match current_state:
		State.IDLE: animated_sprite.play("idle" + direction_suffix)
		State.RUN: animated_sprite.play("run" + direction_suffix)
		State.JUMP: animated_sprite.play("jump" + direction_suffix)
		State.DOWN: animated_sprite.play("jump" + direction_suffix)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	GameState.complete_level()


func _on_enter_undergound_body_entered(_body: Node2D) -> void:
	var timer = get_node_or_null("/root/City/Ui/GlobalTimer/Timer")
	var time_left = timer.time_left if timer else GameState.initial_time
	GameState.enter_undergound(global_position, time_left)
