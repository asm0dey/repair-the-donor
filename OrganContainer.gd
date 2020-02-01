extends StaticBody2D

export (int) var size
var _mouse_in = false
export (String) var container_name = "bed"

func _organ_taken(organ, _event):
	if _mouse_in:
		print("organ " + organ.organ_name + " is get of " + container_name)


func _organ_released(organ, _event):
	if _mouse_in:
		print("organ " + organ.organ_name + " is put on " + container_name)
