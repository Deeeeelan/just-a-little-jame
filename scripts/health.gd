extends ProgressBar

func _process(delta: float) -> void:
	value = lerpf(value, %Player.health, 0.4)
