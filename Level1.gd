extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	assign_organ_actions()
	assign_organs()
	
func assign_organ_actions():
	for organ in get_tree().get_nodes_in_group("organs"):
		for bed in get_tree().get_nodes_in_group("beds"):
			print("connecting "+organ.organ_name+" ro bed "+bed.container_name)
			organ.connect("organ_released", bed, "_organ_released")
			organ.connect("organ_taken", bed, "_organ_taken")

func assign_organs():
	for group in ["b1","b2"]:
		var organs = []
		var bed
		for obj in get_tree().get_nodes_in_group(group):
			if obj is StaticBody2D:
				bed = obj
			elif obj is KinematicBody2D:
				organs.append(obj)
		bed.organs = organs
		for organ in organs:
			bed.places[organ.type] = organ.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
