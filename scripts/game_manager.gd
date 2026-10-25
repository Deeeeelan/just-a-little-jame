extends Node

var started = false

@export var progress: float = 0.0
@export var bg_speed: float = 50.0
@export var paralax: Parallax2D

var spawn_pos = Vector2(1100, 0)

var bg_lerp: float = 0.15

const ASTEROID = preload("res://assets/nodes/asteroid.tscn")
const ASTEROID_EXPLODE = preload("res://assets/nodes/asteroid_explode.tscn")

func _process(delta: float) -> void:
	paralax.autoscroll.x = lerpf(paralax.autoscroll.x, -bg_speed, bg_lerp)
	

func spawn_scatter(instance: Resource) -> Variant:
	var obj: RigidBody2D = instance.instantiate()
	%Debris.add_child(obj)
	obj.position = spawn_pos + Vector2(0, randi_range(-340, 340))
	obj.linear_velocity = Vector2(randi_range(-600, -250), 0)
	# obj.linear_damp = randf_range(-10, 8)
	obj.angular_velocity = deg_to_rad(randi_range(-360, 360))
	obj.angular_damp = randf_range(0, 1)
	return obj

func start_game():
	if started: return
	started = true
	print("start")
	bg_speed = 300
	%Progress.start()
	while true:
		spawn_scatter(ASTEROID_EXPLODE)
		await get_tree().create_timer(1).timeout
