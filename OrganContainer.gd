class_name OrganContainer
extends StaticBody2D

export (int) var size
var _mouse_in = false
export (String) var container_name
export (float) var decrement_per_iteration = 0.3
export (Dictionary) var places
var organs: Array

func _process(_delta):
	for organ in organs:
		if organ.state != 0 and organ.time_left > 0:
			organ.time_left -= decrement_per_iteration

func _organ_taken(organ: BaseOrgan, _event):
	if _mouse_in:
		var i = organs.find(organ)
		if i >= 0:
			organs.remove(i)

func _organ_released(organ: BaseOrgan, _event):
	if _mouse_in:
		place_organ(organ)

func place_organ(_organ: BaseOrgan):
	pass

func _reject_organ(organ: BaseOrgan):
	organ.global_position = organ.default_position
