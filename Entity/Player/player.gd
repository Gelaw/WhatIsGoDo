extends "res://Entity/Entity.gd"

var busy = false

var stats : StatHolder

func _ready():
	super()
	if not stats:
		stats = StatHolder.new()
	pass

func _physics_process(delta):
	super(delta)
	
	if randf()>.75:
		weaponAttack($weapon1)
		weaponAttack($weapon2)
	else:
		weaponAttack($weapon2)
		weaponAttack($weapon1)
	pass

func weaponAttack(weapon):
	if busy: return
	if weapon.trySwing():
		$InterAttackTimer.start()
		busy = true

func _on_inter_attack_timer_timeout():
	busy = false
	stats.StatBoost("Constitution")
	pass # Replace with function body.
