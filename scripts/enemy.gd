extends CharacterBody2D
# this enemy needs to spawn outside of the camera and despawn when the player is at a certain distance from it
# It needs to have some sort of searching behavior so that it can find the player
# If it does then it needs to follow the player and if its close to you then it will attack

var speed = 50
var direction = Vector2.ZERO
var timer = 0.0

func _ready():
	newDirection()

func _physics_process(delta):
	timer -= delta
	if timer <= 0:
		newDirection()

	velocity = direction * speed
	move_and_slide()

func newDirection():
	var angle = randf_range(0, TAU)
	direction = Vector2.from_angle(angle)
	timer = randf_range(2, 5)
