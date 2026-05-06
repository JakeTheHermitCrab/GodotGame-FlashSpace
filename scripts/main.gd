extends Node

signal itemSwitch1
signal itemSwitch2
signal itemSwitch3

var object = preload("res://scenes/object.tscn")
var objectCount = 400

func _ready():
	objectSpawn()

func _process(delta):
	if Input.is_action_just_pressed("itemSlot1"):
		emit_signal("itemSwitch1")
	else:
		if Input.is_action_just_pressed("itemSlot2"):
			emit_signal("itemSwitch2")
		else:
			if Input.is_action_just_pressed("itemSlot3"):
				emit_signal("itemSwitch3")
	

func _on_static_body_2d_game_won() -> void:
	get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

func objectSpawn():
	for i in range(objectCount):
		var instance = object.instantiate()
		var randomPos = Vector2(randf_range(3000,-3000), randf_range(3000,-3000))
		instance.global_position = randomPos
		add_child(instance)
