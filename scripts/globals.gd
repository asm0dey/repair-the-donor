extends Node


var score = 0

var b1_num_kidneys = 2

func count_alive_organs(beds):
	var alive_organs = 0
	for bed in beds:
		for organ in bed.organs:
			if organ.state != BaseOrgan.State.DEAD:
				alive_organs += 1
	return alive_organs
