extends CharacterBody2D


func _process(delta):
	look_at(get_global_mouse_position())


func _on_main_item_switch_1() -> void:
	$AnimatedSprite2D.play("arm_straight")


func _on_main_item_switch_2() -> void:
	$AnimatedSprite2D.play("arm_bent")


func _on_main_item_switch_3() -> void:
	$AnimatedSprite2D.play("arm_bent")
