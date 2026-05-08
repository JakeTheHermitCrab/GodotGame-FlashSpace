extends StaticBody2D
# this object needs to randomly spawn outside of the camera and despawn at a certain distance. This object needs to slowly move in a random direction while also spinning
func _ready():
	await get_tree().process_frame
	print("nav_rid:", $NavigationObstacle2D.get_navigation_map())
