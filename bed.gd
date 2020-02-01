extends "res://OrganContainer.gd"

var mouse_in = false
export (String) var bed_name = "bed"

func _on_Bed_mouse_entered():
	mouse_in = true


func _on_Bed_mouse_exited():
	mouse_in = false


func organ_taken(organ, event):
	pass # Replace with function body.


func organ_released(organ, event):
	if mouse_in:
		print("organ " + organ.organ_name + " is put on " + bed_name)
