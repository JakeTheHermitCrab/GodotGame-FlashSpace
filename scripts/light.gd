extends Area2D

var flashTime = randi_range(1.00, 10.00)

func _ready():
	hide()
	


func _on_flash_light_flash_click() -> void:
	show()
	print("show")
	await get_tree().create_timer(flashTime).timeout
	hide()



#func _on_flash_light_flash_not_click() -> void:
	#hide()
	#print("hide")
	
