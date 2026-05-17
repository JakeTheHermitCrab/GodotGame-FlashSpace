extends Area2D

@onready var instance = get_tree().current_scene

func _start():
	hide()

func _physics_process(delta):
	compassHide()
	var centerX = get_viewport().get_visible_rect().size.x / 2
	var mouseX = get_viewport().get_mouse_position().x
	$AnimatedSprite2D.flip_v = mouseX < centerX
	$AnimatedSprite2D2.flip_v = mouseX < centerX
	
	

func _on_player_compass_switch() -> void:
	show()
	$switch.play()


func compassHide():
	if Global.isCompassSelected == 0:
		hide()
	else:
		show()
	
