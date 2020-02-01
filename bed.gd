extends "res://OrganContainer.gd"


func _on_Bed_mouse_entered():
	_mouse_in = true
	print("mouse in " + container_name)


func _on_Bed_mouse_exited():
	_mouse_in = false
	print("mouse out of " + container_name)

func place_organ(organ:KinematicBody2D):
	for child in organs:
		if child.type == organ.type:
			_reject_organ(organ)
			return
	organ.set_position(places[organ.type])
	organs.append(organ)
	print("Putting organ type %s to position %s" % [organ.type, places[organ.type]] )
