extends Area2D

func _ready():
	hide()

func _on_flash_light_flash_click() -> void:
	show()


func _on_flash_light_flash_not_click() -> void:
	hide()
