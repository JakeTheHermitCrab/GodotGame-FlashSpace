extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()




func _on_player_shot_gun_switch() -> void:
	show()
