extends Button

func _pressed() -> void:
	get_parent().visible = false
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
