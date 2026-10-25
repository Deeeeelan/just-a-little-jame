extends Node

var started = false

@onready var waves: Node = $Waves

@export var progress: float = 0.0
@export var bg_speed: float = 50.0
@export var paralax: Parallax2D

var bg_lerp: float = 0.15

const ASTEROID = preload("res://assets/nodes/asteroid.tscn")
const ASTEROID_EXPLODE = preload("res://assets/nodes/asteroid_explode.tscn")
const STAR = preload("res://assets/nodes/star.tscn")
const STAR_2 = preload("res://assets/nodes/star2.tscn")
const ASTEROID_EXPLODE_2 = preload("res://assets/nodes/asteroid_explode2.tscn")

func _process(delta: float) -> void:
	paralax.autoscroll.x = lerpf(paralax.autoscroll.x, -bg_speed, bg_lerp)

func end_game():
	var tw = get_tree().create_tween()
	tw.tween_property($"../CanvasLayer/WinScreen", "modulate", Color(1.0, 1.0, 1.0, 1.0), 5)
	tw.play()
	await tw.finished
	Engine.time_scale = 0

func start_game():
	if started: return
	started = true
	var tw = get_tree().create_tween()
	tw.tween_property($"../CanvasLayer/Start/title", "modulate", Color(1.0, 1.0, 1.0, 0.0), 2)
	tw.play()
	print("start")
	bg_speed = 300
	%Progress.start()
	waves.start()
