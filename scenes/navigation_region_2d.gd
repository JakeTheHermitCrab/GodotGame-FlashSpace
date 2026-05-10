extends NavigationRegion2D
@onready var navigation_region: NavigationRegion2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	navigation_region.bake_navigation_polygon()
