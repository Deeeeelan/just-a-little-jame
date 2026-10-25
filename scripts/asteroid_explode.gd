extends RigidBody2D

const BULLET = preload("res://assets/nodes/bullet.tscn")

func spawn(instance: Resource, rot : float) -> Variant:
	var obj: RigidBody2D = instance.instantiate()
	get_parent().add_child(obj)
	obj.position = position
	obj.linear_velocity = Vector2.from_angle(deg_to_rad(rot)).normalized() * 400
	#obj.angular_velocity = deg_to_rad(randi_range(-360, 360))
	#obj.angular_damp = randf_range(0, 1)
	return obj
	
func _ready() -> void:
	$Timer.wait_time = randf_range(1, 3)
	$Timer.start()
	$Timer.timeout.connect(func():
		freeze = true
		var bullets : float = randi_range(8, 16)
		var deg: float = 360.0 / bullets
		var cur = randf_range(0, 180.0)
		for b in bullets:
			spawn(BULLET, cur)
			print(cur)
			cur += deg
		queue_free()
	)
