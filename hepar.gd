extends "res://organ.gd"


func _set_state(state):
	if state == State.GOOD:
		$Sprite3.hide()
		$Sprite.show()
	if state == State.DEAD:
		$Sprite.hide()
		$Sprite3.show()
