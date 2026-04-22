extends Node2D
@onready var player: CharacterBody2D = $"../player"


func _process(delta):
	global_position = player.global_position
