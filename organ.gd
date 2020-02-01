extends KinematicBody2D

enum State {GOOD, BAD, UGLY, DEAD}

export (State) var state
export (float) var time_left

var dragging = false

func _process(delta):
	if dragging:
		set_position(get_viewport().get_mouse_position())

func _on_Organ_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false
		
