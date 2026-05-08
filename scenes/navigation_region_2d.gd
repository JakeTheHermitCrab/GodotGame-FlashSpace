extends NavigationRegion2D


# Called when the node enters the scene tree for the first time.
func _ready():
	NavigationServer2D.map_force_update(get_world_2d().navigation_map)
