extends StaticBody2D

export (int) var size
var _mouse_in = false
export (String) var container_name
export (float) var decrement_per_iteration = 0.3
var organs = []

func _process(_delta):
	for organ in organs:
		if organ.time_left > 0:
			organ.time_left -= decrement_per_iteration

func _organ_taken(organ, _event):
	if _mouse_in:
		organs.remove(organs.find(organ))
		print("organ " + organ.organ_name + " is got of " + container_name)


func _organ_released(organ, _event):
	if _mouse_in:
		organs.append(organ)
		print("organ " + organ.organ_name + " is put on " + container_name)
