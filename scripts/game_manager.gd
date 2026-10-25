extends Node

var started = false

@export var progress: float = 0.0
@export var bg_speed: float = 50.0
@export var paralax: Parallax2D

var bg_lerp: float = 0.15

func _process(delta: float) -> void:
	paralax.autoscroll.x = lerpf(paralax.autoscroll.x, -bg_speed, bg_lerp)

func start_game():
	if started: return
	started = true
	print("start")
	bg_speed = 300
	%Progress.start()
