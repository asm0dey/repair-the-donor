extends "res://OrganContainer.gd"

enum State {NEUTRAL, DEAD, HAPPY, SCARED}
enum OrganState {GOOD, BAD, UGLY, DEAD}
enum Type {HEART, LEFT_LUNG, RIGHT_LUNG, LEFT_KIDNEY, RIGHT_KIDNEY, HEPAR}
export (State) var state

export (Dictionary) var organ_states = {
	Type.HEART: true,
	Type.LEFT_LUNG: true,
	Type.RIGHT_LUNG: true,
	Type.LEFT_KIDNEY: true,
	Type.RIGHT_KIDNEY: true,
	Type.HEPAR: true,
}

func _ready():
	for organ in get_children():
		if organ.is_in_group("organs"):
			places[organ.type] = organ.global_position
			organ.container = self
			organs.append(organ)
			if not organ_states[organ.type]:
				organ.queue_free()

func hide_all_sprites():
	$SpriteNeutral.hide()
	$SpriteDead.hide()
	$SpriteHappy.hide()
	$SpriteScared.hide()

func _on_Bed_mouse_entered():
	_mouse_in = true


func _on_Bed_mouse_exited():
	_mouse_in = false

func place_organ(organ:KinematicBody2D):
	for child in organs:
		if child.type == organ.type:
			_reject_organ(organ)
			return
	organ.global_position = places[organ.type]
	organ.default_position = organ.global_position
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
