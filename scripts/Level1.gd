extends Node2D

var starting_time = 100
var time_step = 10
var current_time_left

# Called when the node enters the scene tree for the first time.
func _ready():
	current_time_left = starting_time
	adjust_timer()
	assign_organ_actions()
	
	_on_OrganCountUpdateTimer_timeout()

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if randf() > 0.7:

func _on_HealthUpdateTimer_timeout():
	current_time_left = current_time_left - time_step
	adjust_timer()


func _on_OrganCountUpdateTimer_timeout():
	var num_alive_organs = globals.count_alive_organs(get_tree().get_nodes_in_group("beds"))
	$GUI/HBoxContainer/Counters/Counter/Background/Number.text = "%s" % num_alive_organs



func _on_next_level():
	for t in get_tree().get_nodes_in_group("beds"):
		var bed: Bed = t
		if bed.state != Bed.State.DEAD:
			globals.score += 500
	
	get_tree().current_scene.queue_free()
	get_tree().change_scene("res://scenes/levels/Level2.tscn")
