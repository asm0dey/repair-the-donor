extends "res://OrganContainer.gd"

enum State {NEUTRAL, DEAD, HAPPY, SCARED}
export (State) var state

func hide_all_sprites():
	$SpriteNeutral.hide()
	$SpriteDead.hide()
	$SpriteHappy.hide()
	$SpriteScared.hide()

func _on_Bed_mouse_entered():
	_mouse_in = true
	print("mouse in " + container_name)


func _on_Bed_mouse_exited():
	_mouse_in = false
	print("mouse out of " + container_name)

func place_organ(organ:KinematicBody2D):
	for child in organs:
		if child.type == organ.type:
			_reject_organ(organ)
			return
	organ.set_position(places[organ.type])
	organ.default_position = organ.position
	organs.append(organ)
	organ.container = self
	print("Putting organ type %s to position %s" % [organ.type, places[organ.type]] )


func _on_Heart_organ_died(organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD

func _on_Heart2_organ_died(organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD


func _on_Heart3_organ_died(organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD


func _on_Heart4_organ_died(organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD
