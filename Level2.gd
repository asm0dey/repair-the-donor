extends Node2D

var starting_time = 200
var time_step = 10
var current_time_left

var bed_groups = ["b1","b2",'b3']

# Called when the node enters the scene tree for the first time.
func _ready():
	current_time_left = starting_time
	adjust_timer()
	assign_organ_actions()
	assign_organs()


func adjust_timer():
	if current_time_left < 0:
		current_time_left = 0


func assign_organ_actions():
	for organ in get_tree().get_nodes_in_group("organs"):
		for bed in get_tree().get_nodes_in_group("beds"):
			print("connecting "+organ.organ_name+" ro bed "+bed.container_name)
			organ.connect("organ_released", bed, "_organ_released")
			organ.connect("organ_taken", bed, "_organ_taken")

func assign_organs():
	for group in bed_groups:
		var organs = []
		var fake_organs = []
		var bed
		for obj in get_tree().get_nodes_in_group(group):
			if obj is StaticBody2D:
				bed = obj
			elif obj is KinematicBody2D:
				if obj.to_delete:
					fake_organs.append(obj)
				else:
					organs.append(obj)
				obj.z_index += 1
		bed.organs = organs
		for organ in organs:
			bed.places[organ.type] = organ.position
			organ.container = bed
		for organ in fake_organs:
			bed.places[organ.type] = organ.position
			organ.queue_free()
