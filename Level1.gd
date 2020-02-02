extends Node2D

var starting_time = 100
var time_step = 5
var current_time_left

# Called when the node enters the scene tree for the first time.
func _ready():
	current_time_left = starting_time
	adjust_timer()
	assign_organ_actions()
	assign_organs()

func adjust_timer():
	if current_time_left < 0:
		current_time_left = 0
	$GUI/HBoxContainer/Bars/Bar/Count/Background/Number.text = "%s" % current_time_left
	$GUI/HBoxContainer/Bars/Bar/Gauge.value = current_time_left

func assign_organ_actions():
	for organ in get_tree().get_nodes_in_group("organs"):
		for bed in get_tree().get_nodes_in_group("beds"):
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
				obj.z_index += 1
		bed.organs = organs
		for organ in organs:
			bed.places[organ.type] = organ.position
			organ.container = bed
func count_alive_organs():
	var alive_organs = 0
	for group in ["b1","b2"]:
		for obj in get_tree().get_nodes_in_group(group):
			if obj is KinematicBody2D:
				if obj.state != obj.State.DEAD:
					alive_organs += 1
	return alive_organs

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if randf() > 0.7:

func _on_HealthUpdateTimer_timeout():
	current_time_left = current_time_left - time_step
	adjust_timer()
		
	var num_alive_organs = count_alive_organs()
	$GUI/HBoxContainer/Counters/Counter/Background/Number.text = "%s" % num_alive_organs

func _on_Button_pressed():
	get_tree().change_scene("res://Level3.tscn")
