extends Node
@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if animation_player:
		animation_player.play("RESET")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	check_for_menu()

func resume():
	GameState.unpause()
	if animation_player:
		animation_player.play_backwards("blur")

func pause():
	GameState.pause()
	if animation_player:
		animation_player.play("blur")

func check_for_menu():
	if Input.is_action_just_pressed("menu") and !GameState.is_paused:
		pause()
	elif Input.is_action_just_pressed("menu") and GameState.is_paused:
		resume()
		
func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()
