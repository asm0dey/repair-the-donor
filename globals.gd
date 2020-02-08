extends Node


var score = 0

var b1_num_kidneys = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func count_alive_organs(beds):
	var alive_organs = 0
	for bed in beds:
		alive_organs += bed.organs.size()
	return alive_organs
