extends KinematicBody2D

enum State {GOOD, BAD, UGLY, DEAD}

export (State) var state
export (float) var time_left
export (String) var organ_name

var dragging = false

signal organ_taken(organ, event)
signal organ_released(organ, event)

func _process(delta):
	if dragging:
		set_position(get_viewport().get_mouse_position())

func _on_Organ_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			emit_signal("organ_taken", self, event)
			dragging = true
		else:
			emit_signal("organ_released", self, event)
			dragging = false

