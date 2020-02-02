extends KinematicBody2D

enum State {GOOD, BAD, UGLY, DEAD}
enum Type {HEART, LEFT_LUNG, RIGHT_LUNG, LEFT_KIDNEY, RIGHT_KIDNEY, HEPAR}
export (State) var state
export (float) var time_left
export (Type) var type
export (String) var organ_name

var dragging = false
var death_printed = false

var default_position: Vector2

signal organ_taken(organ, event)
signal organ_released(organ, event)

func _ready():
	default_position = position
	organ_name = Type.keys()[type]

func _process(_delta):
	if time_left <= 0:
		input_pickable = false
		if !death_printed:
			print(organ_name + " is dead")
			death_printed = true
			state = State.DEAD
	if dragging:
		set_position(get_viewport().get_mouse_position())

func _on_Organ_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			emit_signal("organ_taken", self, event)
			dragging = true
		else:
			emit_signal("organ_released", self, event)
			dragging = false
