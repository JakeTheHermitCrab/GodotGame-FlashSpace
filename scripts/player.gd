extends CharacterBody2D
@export var acceleration: float = 10.0

const SPEED = 300
var movement_direction: Vector2 = Vector2.ZERO


func _physics_process(delta: float):
	if velocity != Vector2.ZERO:
		var mainAngle = velocity.angle()
		var rotation_speed: float = PI * 2
		rotation = lerp_angle(rotation, mainAngle, delta * rotation_speed)
	movement()
	move_and_slide()
	while Global.gunShoot == 1:
		var mouseDirection = global_position.direction_to(get_global_mouse_position())
		var oppositeDireciton = -mouseDirection
		var targtVelocity = oppositeDireciton * SPEED
		velocity = velocity.lerp(targtVelocity, acceleration * delta)
		move_and_slide()
		

func movement():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * SPEED

signal flashLightSwitch
func _on_main_item_switch_1() -> void:
	emit_signal("flashLightSwitch")
	Global.isFlashSelected = 1
	Global.isGunSelected = 0
	Global.isCompassSelected = 0

signal shotGunSwitch
func _on_main_item_switch_2() -> void:
	emit_signal("shotGunSwitch")
	Global.isFlashSelected = 0
	Global.isGunSelected = 1
	Global.isCompassSelected = 0
#
signal compassSwitch
func _on_main_item_switch_3() -> void:
	emit_signal("compassSwitch")
	Global.isFlashSelected = 0
	Global.isGunSelected = 0
	Global.isCompassSelected = 1
