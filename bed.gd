extends "res://OrganContainer.gd"

var waiting_for_organ = false

func _on_Bed_mouse_entered():
	waiting_for_organ = true


func _on_Bed_mouse_exited():
	waiting_for_organ = false

func organ_released(organ, event):
	print("organ " + organ.organ_name + " is here")
