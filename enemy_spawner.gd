extends Node2D

const ENEMY_SCENE = preload("res://enemy.tscn")

@onready var timer = $Timer
@onready var spawnpoints = $Spawnpoints


func get_spawn_pos():
	var points = spawnpoints.get_children()
	var random_point = points.pick_random()
	return random_point.global_position


func spawn_enemy():
	var enemy = ENEMY_SCENE.instantiate()
	var world = get_tree().current_scene
	world.add_child(enemy)
	var spawn_pos = get_spawn_pos()
	enemy.position = spawn_pos
	
	if timer.wait_time > .5: 
		timer.wait_time -= .05


func _on_timer_timeout():
	spawn_enemy()
