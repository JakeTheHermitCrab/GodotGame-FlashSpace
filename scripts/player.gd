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

signal flashLightSwitch
func _on_main_item_switch_1() -> void:
	emit_signal("flashLightSwitch")

signal shotGunSwitch
func _on_main_item_switch_2() -> void:
	emit_signal("shotGunSwitch")
#
#signal compassSwitch
#func _on_main_item_switch_3() -> void:
	#pass # Replace with function body.
