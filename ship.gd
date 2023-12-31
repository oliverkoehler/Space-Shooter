extends Area2D

const LASER_SCENE = preload("res://laser.tscn")

var height = ProjectSettings.get_setting("display/window/size/viewport_height")

@export var speed = 100

signal ship_destroyed

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if position.y - speed * delta > 0:
			position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		if position.y + speed * delta < height:
			position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var world = get_tree().current_scene
		world.add_child(laser)
		laser.position = position


func _on_area_entered(area: Area2D):
	queue_free()
	area.queue_free()
	ship_destroyed.emit()
