extends RigidBody2D


func _ready() -> void:
	freeze = true
	await get_tree().create_timer(0.03).timeout
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	var p = global_position.y
	var tw = get_tree().create_tween().set_parallel(true).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tw.tween_property(self, "position", Vector2(900, p), 2.5)
	tw.tween_property(self, "rotation", randf()*PI * 5, 2.5)
	tw.play()
	await tw.finished
	freeze = false
	linear_velocity = Vector2(randi_range(-2000, -1500), 0)
	angular_velocity = deg_to_rad(randi_range(-360, 360) * 4)
	$CPUParticles2D.emitting = true
	await get_tree().create_timer(1).timeout
	$CPUParticles2D.emitting = false
