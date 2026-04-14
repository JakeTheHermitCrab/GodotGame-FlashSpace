extends CharacterBody2D
@export var acceleration: float = 10.0

const SPEED = 300
var movement_direction: Vector2 = Vector2.ZERO
var knockBack: Vector2 = Vector2.ZERO
var knockBackTimer: float = 0.0

signal gunHasShot()
func _physics_process(delta: float) -> void:
	if knockBackTimer > 0.0:
		velocity = knockBack
		knockBack = knockBack.lerp(Vector2.ZERO, 7 * delta)
		knockBackTimer -= delta
		if knockBackTimer <= 0.0:
			knockBack = Vector2.ZERO
	else:
		movement()
	playerSpin(delta)
	move_and_slide()
	
	if Global.gunShoot == 1:
		emit_signal("gunHasShot", self)
	
	

func playerSpin(delta: float) -> void:
	if knockBackTimer > 0.0:
		return
		
	if velocity != Vector2.ZERO:
		var mainAngle = velocity.angle()
		var rotationSpeed: float = PI * 2
		rotation = lerp_angle(rotation, mainAngle, delta * rotationSpeed)
	

func movement():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * SPEED


func shotKnockBack(direction: Vector2, force: float, knockBackDuration: float) -> void:
	knockBack = direction.normalized() * force
	knockBackTimer = knockBackDuration
	

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
