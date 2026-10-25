extends Node
@onready var game_manager: Node = %GameManager
var spawn_pos = Vector2(1100, 0)

const ASTEROID = preload("res://assets/nodes/asteroid.tscn")
const ASTEROID_EXPLODE = preload("res://assets/nodes/asteroid_explode.tscn")
const STAR = preload("res://assets/nodes/star.tscn")
const STAR_2 = preload("res://assets/nodes/star2.tscn")

func spawn(instance: Resource) -> Variant:
	var obj: RigidBody2D = instance.instantiate()
	%Debris.add_child(obj)
	obj.position = spawn_pos + Vector2(0, randi_range(-340, 340))
	get_tree().create_timer(5).timeout.connect(func():
		if obj: obj.queue_free()
	)
	return obj
	
func spawn_random_vel(instance: Resource) -> Variant:
	var obj: RigidBody2D = instance.instantiate()
	%Debris.add_child(obj)
	obj.position = spawn_pos + Vector2(0, randi_range(-340, 340))
	obj.linear_velocity = Vector2(randi_range(-600, -250), 0)
	# obj.linear_damp = randf_range(-10, 8)
	obj.angular_velocity = deg_to_rad(randi_range(-360, 360))
	obj.angular_damp = randf_range(0, 1)
	get_tree().create_timer(5).timeout.connect(func():
		if obj: obj.queue_free()
	)
	return obj

func _process(delta: float) -> void:
	var progress = game_manager.progress
	if progress > 0 and progress < 0.08:
		pass
	if progress > 0.08 and progress < 0.16:
		pass
	if progress > 0.16 and progress < 0.24:
		pass
	if progress > 0.24 and progress < 0.32:
		pass
	if progress > 0.32 and progress < 0.40:
		pass
	if progress > 0.40 and progress < 0.48:
		pass
	if progress > 0.48 and progress < 0.56:
		pass
	if progress > 0.56 and progress < 0.64:
		pass
	if progress > 0.64 and progress < 0.72:
		pass
	if progress > 0.72 and progress < 0.8:
		pass
	if progress > 0.8 and progress < 0.9:
		pass
	if progress > 0.9 and progress < 1:
		pass
