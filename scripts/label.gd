extends Label
@onready var label: Label = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

var played = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "YOW WIN YIPIE!!!"
	$"../doorClose".play()
	await get_tree().create_timer(1.0).timeout
	$"../AnimatedSprite2D".play("doorshut")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.playerDeath == 1.0:
		$"../AnimatedSprite2D".hide()
		$"../doorClose".stop()
		label.text = "You died lol"
		if !played:
			$"../death".play()
			played = true
