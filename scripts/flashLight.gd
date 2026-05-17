extends Area2D
@onready var light: Area2D = $light
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal flashClick
signal flashNotClick

func _physics_process(delta):
	flashHide()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and Global.isFlashSelected == 1:
		$flashlighClick.play()
		emit_signal("flashClick")

#google for later: is there a way to get input from a mouse that is holding down left click godot


func _on_player_flash_light_switch() -> void:
	$itemSwitch.play()
	show()

func flashHide():
	if Global.isFlashSelected == 0:
		animated_sprite_2d.hide()
	else:
		animated_sprite_2d.show()
