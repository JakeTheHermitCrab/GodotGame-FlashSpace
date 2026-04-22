extends Area2D



func _ready():
	hide()
	


func _on_flash_light_flash_click() -> void:
	show()
	await get_tree().create_timer(15.00).timeout
	hide()



#func _on_flash_light_flash_not_click() -> void:
	#hide()
	#print("hide")
	
