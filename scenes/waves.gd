extends Node
@onready var game_manager: Node = %GameManager
var spawn_pos = Vector2(1100, 0)

const ASTEROID = preload("res://assets/nodes/asteroid.tscn")
const ASTEROID_EXPLODE = preload("res://assets/nodes/asteroid_explode.tscn")
const STAR = preload("res://assets/nodes/star.tscn")
const STAR_2 = preload("res://assets/nodes/star2.tscn")
var cooldown = 8

func spawn(instance: Resource, vel: int, pos: int) -> Variant:
	var obj: RigidBody2D = instance.instantiate()
	%Debris.add_child(obj)
	obj.linear_velocity = Vector2(vel, 0)
	obj.position = spawn_pos + Vector2(0, pos)
	obj.angular_velocity = deg_to_rad(randi_range(-360, 360))
	obj.angular_damp = randf_range(0, 1)
	get_tree().create_timer(5).timeout.connect(func():
		if obj: obj.queue_free()
	)
	return obj
	
func spawn_random_vel(instance: Resource) -> Variant:
	var obj: RigidBody2D = instance.instantiate()
	%Debris.add_child(obj)
	obj.position = spawn_pos + Vector2(0, randi_range(-340, 340))
	obj.linear_velocity = Vector2(randi_range(-600, -350), 0)
	# obj.linear_damp = randf_range(-10, 8)
	obj.angular_velocity = deg_to_rad(randi_range(-360, 360))
	obj.angular_damp = randf_range(0, 1)
	get_tree().create_timer(5).timeout.connect(func():
		if obj: obj.queue_free()
	)
	return obj

func get_rand_proj1():
	var projs = [ASTEROID, STAR]
	return projs[randi_range(0,1)]

func get_rand_proj2():
	var projs = [ASTEROID, STAR, [STAR_2, ASTEROID_EXPLODE]]
	if randi_range(0, 2) == 2:
		return projs[2][randi_range(0, 1)]
	return projs[randi_range(0,1)]

func get_rand_proj3():
	var projs = [ASTEROID_EXPLODE, STAR_2]
	return projs[randi_range(0,1)]


func start():
	#DEBUG CHANGE THIS LATER
	var progress = 0.161
	while true:
		#var progress = game_manager.progress
		if progress >= 0 and progress < 0.08:
			spawn_random_vel(get_rand_proj1())
			await get_tree().create_timer(1.5).timeout
		if progress > 0.08 and progress < 0.16:
			spawn_random_vel(get_rand_proj1())
			await get_tree().create_timer(1).timeout
		if progress > 0.16 and progress < 0.24:
			spawn(ASTEROID, -400, 300)
			spawn(ASTEROID, -400, -300)

			await get_tree().create_timer(0.6).timeout
			
			spawn(ASTEROID, -400, 200)
			spawn(ASTEROID, -400, -200)
			await get_tree().create_timer(0.6).timeout
			
			spawn(ASTEROID, -400, 100)
			spawn(ASTEROID, -400, -100)
			await get_tree().create_timer(0.6).timeout
			
			spawn(ASTEROID, -400, 0)
			await get_tree().create_timer(0.6).timeout
			
		if progress > 0.24 and progress < 0.32:
			spawn_random_vel(get_rand_proj2())
			await get_tree().create_timer(1.4).timeout
		if progress > 0.32 and progress < 0.40:
			spawn_random_vel(get_rand_proj2())
			await get_tree().create_timer(0.8).timeout
		if progress > 0.40 and progress < 0.48:
			#spawn(STAR_2, )
			pass
			
			
			
		if progress > 0.48 and progress < 0.56:
			spawn_random_vel(get_rand_proj2())
			await get_tree().create_timer(1).timeout
		if progress > 0.56 and progress < 0.64:
			spawn_random_vel(get_rand_proj3())
			await get_tree().create_timer(0.8).timeout
		if progress > 0.64 and progress < 0.72:
			pass
			
			
			
		if progress > 0.72 and progress < 0.8:
			spawn_random_vel(get_rand_proj3())
			await get_tree().create_timer(0.7).timeout
		if progress > 0.8 and progress < 0.9:
			spawn_random_vel(get_rand_proj3())
			await get_tree().create_timer(0.6).timeout
		if progress > 0.9 and progress < 1:
			spawn(ASTEROID_EXPLODE, -400, 300)
			spawn(ASTEROID_EXPLODE, -400, -300)
			spawn(STAR, -400, 250)
			spawn(STAR, -400, -250)

			await get_tree().create_timer(0.6).timeout
			
			spawn(ASTEROID_EXPLODE, -400, 200)
			spawn(ASTEROID_EXPLODE, -400, -200)
			spawn(STAR, -400, 150)
			spawn(STAR, -400, -150)
			await get_tree().create_timer(0.6).timeout
			
			spawn(ASTEROID_EXPLODE, -400, 100)
			spawn(ASTEROID_EXPLODE, -400, -100)
			spawn(STAR, -400, 50)
			spawn(STAR, -400, -50)
			await get_tree().create_timer(0.6).timeout
			
			spawn(ASTEROID_EXPLODE, -400, 0)
			spawn(STAR_2, -400, 50)
			spawn(STAR_2, -400, -50)
			await get_tree().create_timer(0.6).timeout
		else:
			await get_tree().create_timer(1).timeout
