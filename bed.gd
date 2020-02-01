extends "res://OrganContainer.gd"


func _on_Bed_mouse_entered():
	_mouse_in = true
	print("mouse in " + container_name)


func _on_Bed_mouse_exited():
	_mouse_in = false
	print("mouse out of " + container_name)
