extends CharacterBody2D
@onready var agent: NavigationAgent2D = $NavigationAgent2D
@onready var player: CharacterBody2D = $"../playerRelated/player"
@onready var ray: RayCast2D = $RayCast2D


var speed = 200
var turnStrength = 2.0
func _ready():
	agent.avoidance_enabled = true
	

func _physics_process(delta):
	agent.target_position = player.global_position
	if agent.is_navigation_finished():
		return
	var current_pos = global_position
	var next_path_pos = agent.get_next_path_position()
	#var new_velocity = (next_path_pos - current_pos).normalized() * speed
	var dir = (agent.get_next_path_position() - global_position).normalized()
	ray.target_position = dir * 120
	ray.force_raycast_update()
	if ray.is_colliding():
		var normal = ray.get_collision_normal()
		var side = dir.rotated(PI / 2)
		dir = (dir + side * turnStrength).normalized
		velocity = dir * speed
	move_and_slide()
