extends CharacterBody2D

@export var SPEED = 300

var center = self.position
var tick : float = 0

func _process(delta: float) -> void:
		#tick += delta
		#position = center + Vector2(0, sin(tick) * 20)
		#rotation_degrees = (position - center).y / 4
		pass

func _body_entered(body: Node2D):
	print(body)
	
func _input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	velocity = direction * SPEED
	move_and_slide()
