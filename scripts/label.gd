extends Label
@onready var label: Label = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "YOW WIN YIPIE!!!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.playerDeath == 1.0:
		label.text = "You died lol"
