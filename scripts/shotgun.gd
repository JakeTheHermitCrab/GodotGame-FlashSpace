extends Area2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var player = get_tree().get_first_node_in_group("player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func _physics_process(delta):
	gunHide()
	gunShoot()

func gunShoot():
	if Input.is_action_just_pressed("leftClick") and Global.isGunSelected == 1:
		Global.gunShoot = 1
		if ray_cast_2d.is_colliding():
			print("bang")
		else:
			print("nothing")
	else:
		Global.gunShoot = 0

func _on_player_shot_gun_switch() -> void:
	show()
	print("shotGun")


func gunHide():
	if Global.isGunSelected == 0:
		hide()
		set_process(false)

	if Global.isGunSelected == 1:
		show()
		set_process(true)


func _on_player_gun_has_shot(player: Node2D) -> void:
		var direction = (player.global_position - get_global_mouse_position()).normalized()
		player.shotKnockBack(direction, 3500.0, 0.25)
