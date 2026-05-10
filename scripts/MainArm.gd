extends CharacterBody2D


func _process(delta):
	look_at(get_global_mouse_position())
	var centerX = get_viewport().get_visible_rect().size.x / 2
	var mouseX = get_viewport().get_mouse_position().x

	$AnimatedSprite2D.flip_v = mouseX < centerX


func _on_main_item_switch_1() -> void:
	$AnimatedSprite2D.frame = 0


func _on_main_item_switch_2() -> void:
	$AnimatedSprite2D.frame = 1


func _on_main_item_switch_3() -> void:
	$AnimatedSprite2D.frame = 1
