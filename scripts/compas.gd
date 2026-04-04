extends Area2D


func _start():
	hide()

func _physics_process(delta):
	compassHide()

func _on_player_compass_switch() -> void:
	show()
	print("compass")


func compassHide():
	if Global.isCompassSelected == 0:
		hide()
		set_process(false)
	if Global.isCompassSelected == 1:
		show()
		set_process(true)
