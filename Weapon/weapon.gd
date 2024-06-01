extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var swingSpeed :float = 0
var isSwinging = false
@export var auto: bool = true
@export var maxSwingSpeed :float = 30

@onready var cooldown_timer = $CooldownTimer
@onready var ap: AnimationPlayer = $AnimationPlayer
@onready var anchor: Node2D = $weaponAnchor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anchor.rotate(delta*swingSpeed)
	pass
	
func trySwing():
	if isSwinging:
		return false
	var bodies = $RangeHitbox.get_overlapping_bodies()
	if bodies.size() > 0 :
		swing(bodies.front().global_position)
		return true
	return false
	
func swing(target):
	isSwinging = true
	anchor.look_at(target)
	anchor.rotate(-PI/3)
	ap.play("swing")
	cooldown_timer.start()
	pass

func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	pass # Replace with function body.

func _on_cooldown_timer_timeout():
	isSwinging = false
	pass # Replace with function body.
