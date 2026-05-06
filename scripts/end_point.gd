extends Area2D

signal gameWon()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("win")
		emit_signal("gameWon")
