extends Sprite2D

var center = self.position
var tick : float = 0

func _process(delta: float) -> void:
	tick += delta
	position = center + Vector2(0, sin(tick) * 20)
	print(tick)
	rotation_degrees = (position - center).y / 4
