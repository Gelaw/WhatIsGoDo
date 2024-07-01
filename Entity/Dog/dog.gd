extends "res://Entity/Entity.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node("/root/main/Player")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var bodies = $pickupRange.get_overlapping_bodies()
	for body in bodies:
		if body.has_method("pickup"):
			body.pickup()
	pass



func _on_pickup_range_area_entered(xporb):
	print("?")
	if xporb.has_method("pickup"):
		print("!")
		xporb.pickup()
	pass# Replace with function body.
