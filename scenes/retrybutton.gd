extends Button

func _pressed() -> void:
	%GameManager.start_game()
	visible = false
