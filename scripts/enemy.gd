extends CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var player: CharacterBody2D = $"../playerRelated/player"
var speed = 1200.0

func _physics_process(delta):
	navigation_agent_2d.target_position = player.global_position

	if navigation_agent_2d.is_navigation_finished():
		return

	var next_pos = navigation_agent_2d.get_next_path_position()

	# THIS is the important part:
	var desired_velocity = (next_pos - global_position).normalized() * 2000

	# let the agent apply avoidance
	navigation_agent_2d.set_velocity(desired_velocity)

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
