extends "res://OrganContainer.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for organ in get_tree().get_nodes_in_group("organs"):
		organs.append(organ)



func _on_Bed_mouse_entered():
	_mouse_in = true
	print("mouse in " + container_name)


func _on_Bed_mouse_exited():
	_mouse_in = false
	print("mouse out of " + container_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
