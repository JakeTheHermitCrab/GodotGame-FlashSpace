extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_pressed() -> void:
	print("retry")
	Global.playerDeath = 0.0
	Global.voidDeath = 0.0
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_mainmenu_pressed() -> void:
	print("main menu")
	Global.playerDeath = 0.0
	Global.voidDeath = 0.0
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")
