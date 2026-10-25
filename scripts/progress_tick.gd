extends Timer

func _ready() -> void:
	timeout.connect(func():
		%GameManager.progress += 0.002
	)
