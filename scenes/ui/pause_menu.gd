extends Control
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var panel_container : PanelContainer = $PanelContainer
@onready var color_rect : ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if panel_container:
		panel_container.hide()
	if color_rect:
		color_rect.hide()
	if animation_player:
		animation_player.play("RESET")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	check_for_menu()

func resume():
	GameState.unpause()
	if animation_player:
		animation_player.play_backwards("blur")
	await animation_player.animation_finished
	if panel_container:
		panel_container.hide()
	if color_rect:
		color_rect.hide()

func pause():
	if color_rect:
		color_rect.show()
	if panel_container:
		panel_container.show()
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
	GameState.reset_level()

func _on_quit_pressed() -> void:
	get_tree().quit()
