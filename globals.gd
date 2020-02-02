extends Node


var score = 0

var b1_num_kidneys = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func count_alive_organs(bed_groups):
	var alive_organs = 0
	for group in bed_groups:
		for obj in get_tree().get_nodes_in_group(group):
			if obj is KinematicBody2D:
				if obj.state != obj.State.DEAD:
					alive_organs += 1
	return alive_organs
