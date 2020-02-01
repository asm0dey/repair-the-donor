extends "res://organ.gd"

func _process(_delta):
	if state == State.GOOD:
		$Sprite.show()
		$Sprite2.hide()
		$Sprite3.hide()
	if state == State.BAD:
		$Sprite.hide()
		$Sprite2.show()
		$Sprite3.hide()
	if state == State.DEAD:
		$Sprite.hide()
		$Sprite2.hide()
		$Sprite3.show()
