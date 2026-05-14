extends Node
@onready var navigation_region: NavigationRegion2D = $NavigationRegion2D
@onready var player: CharacterBody2D = $playerRelated/player

signal itemSwitch1
signal itemSwitch2
signal itemSwitch3

var object = preload("res://scenes/object.tscn")
var endPoint = preload("res://scenes/end_point.tscn")
var enemy = preload("res://scenes/enemy.tscn")
var objectCount = 700
var enemyCOunt = 10
var endx
var endy

func _ready():
	endSpawn()
	objectSpawn()
	enemySpawn()
	
func _process(delta):
	if Input.is_action_just_pressed("itemSlot1"):
		emit_signal("itemSwitch1")
	else:
		if Input.is_action_just_pressed("itemSlot2"):
			emit_signal("itemSwitch2")
		else:
			if Input.is_action_just_pressed("itemSlot3"):
				emit_signal("itemSwitch3")
	if Global.playerDeath == 1.0:
		get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

func _on_static_body_2d_game_won() -> void:
	get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

func objectSpawn():
	var spawnPosition = []
	var minDist = 150.0
	for i in range(objectCount):
		var validPos = false
		var newPos = Vector2.ZERO
		var attempts = 0
		while !validPos and attempts < 100:
			newPos = Vector2(randf_range(-5000, 6000), randf_range(-5000, 5000))
			validPos = true
			for pos in spawnPosition:
				if newPos.distance_to(pos) < minDist:
					validPos = false
					break
			attempts += 1
		if validPos:
			var instance = object.instantiate()
			instance.global_position = newPos
			add_child(instance)
			spawnPosition.append(newPos)

func endSpawn():
	var instance = endPoint.instantiate()
	var randomPos = Vector2(randf_range(6000,-5000), randf_range(5000,-5000))
	instance.global_position = randomPos
	instance.gameWon.connect(_on_static_body_2d_game_won)
	add_child(instance)
	endx = instance.global_position.x
	endy = instance.global_position.y

func enemySpawn():
	var spawnPosition = []
	var minDist = 150.0
	for i in range(enemyCOunt):
		var validPos = false
		var newPos = Vector2.ZERO
		var attempts = 0
		while !validPos and attempts < 100:
			newPos = Vector2(randf_range(-5000, 6000), randf_range(-5000, 5000))
			validPos = true
			for pos in spawnPosition:
				if newPos.distance_to(pos) < minDist:
					validPos = false
					break
			attempts += 1
		if validPos:
			var enemyinstance = enemy.instantiate()
			enemyinstance.global_position = newPos
			add_child(enemyinstance)
			spawnPosition.append(newPos)

func _on_item_switch_3() -> void:
	pass # Replace with function body.
