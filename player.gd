extends CharacterBody2D


const SPEED = 300
var movement_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float):
	if velocity != Vector2.ZERO:
		var mainAngle = velocity.angle()
		var rotation_speed: float = PI * 2
		rotation = lerp_angle(rotation, mainAngle, delta * rotation_speed)
	movement()
	move_and_slide()

func movement():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * SPEED
