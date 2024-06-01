extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	spawnEnemy()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func spawnEnemy():
	var enemy =  preload("res://Entity/Enemy/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	enemy.position = %PathFollow2D.global_position
	add_child(enemy)


func _on_timer_timeout():
	spawnEnemy()
	pass # Replace with function body.
