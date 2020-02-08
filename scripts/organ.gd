class_name BaseOrgan
extends KinematicBody2D

enum State {GOOD, BAD, UGLY, DEAD}
enum Type {HEART, LEFT_LUNG, RIGHT_LUNG, LEFT_KIDNEY, RIGHT_KIDNEY, HEPAR}
export (State) var state
export (float) var time_left
export (Type) var type
export (String) var _name 


var dragging = false
var death_printed = false

var default_position: Vector2
var container: WeakRef

signal organ_taken(organ, event)
signal organ_released(organ, event)
signal organ_died(organ)

func _ready():
	default_position = position


func _process(_delta):
	if container.get_ref() == null:
		time_left -= 1
	if time_left <= 0:
		input_pickable = false
		if !death_printed:
			state = State.DEAD
	if state == State.DEAD && container.get_ref() == null:
		set_position(Vector2(1500,220))
		emit_signal('organ_died', self)
		return
	if dragging:
		global_position = get_viewport().get_mouse_position()
	_determine_sprite()

func _determine_sprite():
	if state == State.GOOD:
		$Sprite.texture = load("res://organs/" + _name + ".png")
	elif state == State.BAD:
		$Sprite.texture = load("res://organs/" + _name + "-o.png")
	elif state == State.DEAD:
		$Sprite.texture = load("res://organs/" + _name + "-r.png")


func _on_Organ_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			emit_signal("organ_taken", self, event)
			container = weakref(null)
			dragging = true
		else:
			emit_signal("organ_released", self, event)
			dragging = false
