extends Area2D


func _ready():
	hide()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _on_flash_light_flash_click() -> void:
	show()


func _on_flash_light_flash_not_click() -> void:
	hide()
