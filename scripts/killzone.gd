extends Area2D

@onready var pipe = $pipe
@onready var score = $"../Score"

func _on_body_entered(body):
	print("mati")
	get_tree().reload_current_scene()

func _on_body_exited(body):
	print("score!")
