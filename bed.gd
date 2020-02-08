class_name Bed
extends OrganContainer

enum State {NEUTRAL, DEAD, HAPPY, SCARED}
export (State) var state

export (Dictionary) var organ_exists

func _ready():
	for i in get_children():
		if i is BaseOrgan:
			var organ: BaseOrgan = i
			places[organ.type] = organ.global_position
			organ.container = weakref(self)
			organs.append(organ)
			if not organ_exists[BaseOrgan.Type.keys()[organ.type]]:
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

func place_organ(organ: BaseOrgan):
	for child in organs:
		if child.type == organ.type:
			_reject_organ(organ)
			return
	organ.global_position = places[organ.type]
	organ.default_position = organ.global_position
	organs.append(organ)
	organ.container = weakref(self)
	print("Putting organ type %s to position %s" % [organ.type, places[organ.type]] )


func _on_Heart_organ_died(_organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD

func _on_Heart2_organ_died(_organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD


func _on_Heart3_organ_died(_organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD


func _on_Heart4_organ_died(_organ):
	hide_all_sprites()
	$SpriteDead.show()
	
	state = State.DEAD
