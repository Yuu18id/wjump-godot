extends CharacterBody2D

@onready var sprite_2d = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			sprite_2d.rotation -= 1.5
		if sprite_2d.rotation <= -0.5:
			sprite_2d.rotation += 0.5
		sprite_2d.rotation += 0.02
	move_and_slide()
