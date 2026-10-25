extends CharacterBody2D

@export var SPEED = 500
@export var health = 10

var iframe = false

var center = self.position
var tick : float = 0

func _process(delta: float) -> void:
	if health <= 0:
		print("You DId")
		Engine.time_scale = 0
		$"../../CanvasLayer/DeathScreen".visible = true
	#tick += delta
	#position = center + Vector2(0, sin(tick) * 20)
	#rotation_degrees = (position - center).y / 4
	pass

	
func _input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	velocity = direction * SPEED
	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.is_in_group("hazard") and not iframe:
			iframe = true
			collision_layer = 0
			self_modulate = Color(0.564, 0.689, 0.67, 1.0)
			health -= 1
			get_tree().create_timer(1).timeout.connect(func():
				collision_layer = 1
				self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				iframe = false
			)
		if collider.is_in_group("bullet"):
			collider.queue_free()
