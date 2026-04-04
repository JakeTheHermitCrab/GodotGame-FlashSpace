extends Area2D

signal flashClick
signal flashNotClick



func _physics_process(delta):
	flashHide()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		emit_signal("flashClick")
	else:
		emit_signal("flashNotClick")
	

#google for later: is there a way to get input from a mouse that is holding down left click godot


func _on_player_flash_light_switch() -> void:
	show()
	print("flashlight")

func flashHide():
	if Global.isFlashSelected == 0:
		hide()
		set_process(false)
	
	
	if Global.isFlashSelected == 1:
		show()
		set_process(true)
