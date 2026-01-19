extends CanvasLayer

@onready var label1: Label = $QuickInput/CenterContainer/HBoxContainer/PanelContainer/Label
@onready var label2: Label = $QuickInput/CenterContainer/HBoxContainer/PanelContainer2/Label2
@onready var label3: Label = $QuickInput/CenterContainer/HBoxContainer/PanelContainer3/Label3
@onready var label4: Label = $QuickInput/CenterContainer/HBoxContainer/PanelContainer4/Label4

# TODO better inputs than hardcoded shit
var inputs = ["W", "A", "S", "D"]
var solved = 0
var random_inputs = []
var next_input
var puzzle_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# generate random WASD input for 4 items
	random_inputs = [inputs.pick_random(), inputs.pick_random(), inputs.pick_random(), inputs.pick_random()]
	next_input = random_inputs[0]
	# ya this is shit, handwaved
	# set each label to match the random sequence
	label1.text = random_inputs[0]
	label2.text = random_inputs[1]
	label3.text = random_inputs[2]
	label4.text = random_inputs[3]
	# Delay activation to avoid registering the interact key press
	await get_tree().create_timer(0.1).timeout
	puzzle_active = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not puzzle_active:
		return
	if solved < 4:
		match next_input:
			"W":
				if Input.is_action_just_pressed("up"):
					solved += 1
					if solved < 4:
						next_input = random_inputs[solved]
			"S":
				if Input.is_action_just_pressed("down"):
					solved += 1
					if solved < 4:
						next_input = random_inputs[solved]
			"A":
				if Input.is_action_just_pressed("left"):
					solved += 1
					if solved < 4:
						next_input = random_inputs[solved]		
			"D":
				if Input.is_action_just_pressed("right"):
					solved += 1
					if solved < 4:
						next_input = random_inputs[solved]
	elif solved == 4:
		set_done(label4)
		GameState.hide_puzzle()
		GameState.leave_underground()
		solved = 0
	match solved:
		1:
			set_done(label1)
		2:
			set_done(label2)
		3: 
			set_done(label3)

func set_done(label: Label):
	label.add_theme_color_override("font_color", Colors.bright_green)
