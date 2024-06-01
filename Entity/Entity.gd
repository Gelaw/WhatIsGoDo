extends CharacterBody2D

signal entity_death(Entity)

@export var SPEED = 5000.0

@export var color: Color
@export var ai : bool = true
@export var health : int = 20

var target

func _ready():
	$Sprite2D.modulate = color
	if ai :
		target = get_node("/root/main/Player")
	pass

func get_direction():
	if ai:
		return global_position.direction_to(target.global_position)
	else:
		return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

func _physics_process(delta):
	var direction = get_direction()
	velocity = direction * SPEED * delta
	move_and_slide()

func hit():
	#todo health calculation
	ondeathspawn()
	pass

func ondeathspawn():
	emit_signal("entity_death", self)

	call_deferred("add_child_deferred")
	queue_free()
	pass

func add_child_deferred():
	var ent = preload("res://exp_orb.tscn").instantiate()
	ent.global_position = global_position
	get_parent().add_child(ent)
	pass
