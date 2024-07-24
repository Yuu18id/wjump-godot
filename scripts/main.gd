extends Node2D

@onready var pipe_scene = preload("res://scene/pipe.tscn")
@onready var pipe_spawn_timer = $PipeSpawnTimer
@onready var killzone = $Killzone
@onready var score_label = $Score
@onready var player = $player

var score = 0

const PIPE_START_X = 1850
const MIN_Y = 200
const MAX_Y = 600 
const GAP_SIZE = 30

func _ready():
	pipe_spawn_timer.connect("timeout", Callable(self, "_on_PipeSpawnTimer_timeout"))
	pipe_spawn_timer.start()

func _on_PipeSpawnTimer_timeout():
	var bottom_pipe_instance = pipe_scene.instantiate()
	var upper_pipe_instance = pipe_scene.instantiate()

	var bottom_pipe_y = randf_range(MIN_Y, MAX_Y)
	bottom_pipe_instance.position = Vector2(PIPE_START_X, bottom_pipe_y)
	upper_pipe_instance.position = Vector2(PIPE_START_X, bottom_pipe_y - GAP_SIZE)
	upper_pipe_instance.scale.y = -1 

	killzone.add_child(bottom_pipe_instance)
	killzone.add_child(upper_pipe_instance)

	bottom_pipe_instance.connect("score_detected", Callable(self, "_on_score_detected"))
	upper_pipe_instance.connect("score_detected", Callable(self, "_on_score_detected"))

	print("Added pipes at positions: ", bottom_pipe_instance.position, ", ", upper_pipe_instance.position)

func _on_score_detected():
	add_score()

func add_score():
	score += 0.5
	score_label.text = str(score)
