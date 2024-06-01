extends Node

@export var cooled = true
signal fired
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func trigger():
	cooled = false
	
	
func _on_cooldown_timer_timeout():
	cooled = true
	pass # Replace with function body.
