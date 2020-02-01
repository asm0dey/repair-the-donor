extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	for organ in get_tree().get_nodes_in_group("organs"):
		for bed in get_tree().get_nodes_in_group("beds"):
			organ.connect("organ_released", bed, "_organ_released")
			organ.connect("organ_taken", bed, "_organ_taken")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
