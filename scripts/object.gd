extends StaticBody2D
@onready var object: StaticBody2D = $"."

func _ready():
	if has_node("NavigationObstacle2D"):
		$NavigationObject2D.enabled = true
		$NavigationObject2D.avoidance_enabled = true
