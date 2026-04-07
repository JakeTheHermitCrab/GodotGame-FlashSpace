extends Area2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func _physics_process(delta):
	gunHide()
	if Input.is_action_just_pressed("leftClick") and Global.isGunSelected == 1:
		Global.gunShoot = 1
		while Global.gunShoot == 1:
			Global.gunShoot -= 0.1 * delta
			
		

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
