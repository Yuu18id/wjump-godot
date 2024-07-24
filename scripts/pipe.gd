extends Area2D 

@onready var pipe = $"."
var scored = false 
var isplayer_alive = true

func _ready():
	pass  # Replace with function body.

func _process(delta):
	pipe.position.x -= 2
	if pipe.position.x <= -360:
		queue_free()
	
	if pipe.position.x <= 35 and not scored:
		emit_signal("score_detected")
		scored = true

func _on_body_entered(body):
	print("mati")
	isplayer_alive = false
	get_tree().reload_current_scene()

signal score_detected
