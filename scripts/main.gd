extends Node

signal itemSwitch1
signal itemSwitch2
signal itemSwitch3


func _process(delta):
	if Input.is_action_just_pressed("itemSlot1"):
		emit_signal("itemSwitch1")
	else:
		if Input.is_action_just_pressed("itemSlot2"):
			emit_signal("itemSwitch2")
		else:
			if Input.is_action_just_pressed("itemSlot3"):
				emit_signal("itemSwitch3")
