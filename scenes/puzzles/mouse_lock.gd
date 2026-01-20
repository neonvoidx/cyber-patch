extends CanvasLayer
@onready var button1 = $Control/Button
@onready var button2 = $Control/Button2
@onready var button3 = $Control/Button3
@onready var button4 = $Control/Button4

var INPUTS = [button1, button2, button3, button4]
const SEQUENCE_LENGTH = 4

# 
var random_inputs: Array[String] = []
var current_index = 0
var puzzle_active = false

func _ready() -> void:
	random_inputs.resize(SEQUENCE_LENGTH)
	for i in SEQUENCE_LENGTH:
		random_inputs[i] = INPUTS.pick_random()
	puzzle_active = true
		

func _input(event: InputEvent) -> void:
	if not puzzle_active or current_index >= SEQUENCE_LENGTH:
		return
	
	if event is InputEventKey and event.pressed and not event.echo:
		var key_text = OS.get_keycode_string(event.keycode)
		
		if key_text == random_inputs[current_index]:
			current_index += 1
			
			if current_index >= SEQUENCE_LENGTH:
				puzzle_active = false
				GameState.hide_puzzle()
				GameState.leave_underground()

func set_done(label: Label):
	label.add_theme_color_override("font_color", Colors.bright_green)
