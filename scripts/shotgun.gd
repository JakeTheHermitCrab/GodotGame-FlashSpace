extends Area2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var player = get_tree().get_first_node_in_group("player")


func _ready() -> void:
	hide()
	
func _physics_process(delta):
	gunHide()
	gunShoot()
	var centerX = get_viewport().get_visible_rect().size.x / 2
	var mouseX = get_viewport().get_mouse_position().x
	$AnimatedSprite2D.flip_v = mouseX < centerX

func gunShoot():
	if Input.is_action_just_pressed("leftClick") and Global.isGunSelected == 1:
		Global.gunShoot = 1
		$AnimatedSprite2D.play("shoot")
		$shoot.play()
		$reload.play()
		if ray_cast_2d.is_colliding():
			var hit = ray_cast_2d.get_collider()
			if hit and hit.is_in_group("enemy"):
				hit.takeDamage(1)
	else:
		Global.gunShoot = 0
		$AnimatedSprite2D.play("default")

func _on_player_shot_gun_switch() -> void:
	show()
	$switch.play()


func gunHide():
	if Global.isGunSelected == 0:
		hide()
	else:
		show()


func _on_player_gun_has_shot(player: Node2D) -> void:
		var direction = (player.global_position - get_global_mouse_position()).normalized()
		player.shotKnockBack(direction, 3500.0, 0.25)
