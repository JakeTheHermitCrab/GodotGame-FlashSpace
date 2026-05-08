extends CharacterBody2D
@onready var agent: NavigationAgent2D = $NavigationAgent2D
@onready var player: CharacterBody2D = $"../playerRelated/player"
@onready var ray: RayCast2D = $RayCast2D


var speed = 5
var turnStrength = 2.0
func _ready():
	pass

func _physics_process(delta):
	if agent.is_navigation_finished():
		agent.target_position = player.global_position
		velocity = Vector2.ZERO
		return
	var next_path_pos = agent.get_next_path_position()
	var new_velocity = global_position.direction_to(next_path_pos) * speed
	if agent.avoidance_enabled:
		agent.set_velocity(new_velocity)
	else:
		velocity = new_velocity
		move_and_slide()
	
