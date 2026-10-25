extends Timer

func _ready() -> void:
	timeout.connect(func():
		%GameManager.progress += 0.002
		if not Rect2(Vector2(-193.0, -326.0), Vector2(957.0, 331.0)).has_point(%Player.position):
			%Player.health -= 0.05
	)
