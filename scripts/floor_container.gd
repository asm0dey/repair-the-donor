extends "res://OrganContainer.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	for organ in organs:
		if organ.container == null and organ.time_left > 0:
			organ.time_left -= decrement_per_iteration
