extends CharacterBody2D

@onready var agent: NavigationAgent2D = $NavigationAgent2D
@export var speed := 120.0

var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")

	agent.avoidance_enabled = true
	agent.velocity_computed.connect(_on_velocity_computed)

func _physics_process(delta):
	if player == null:
		return

	agent.target_position = player.global_position

	var next_pos = agent.get_next_path_position()
	var desired_velocity = (next_pos - global_position).normalized() * speed

	# THIS is what activates avoidance system
	agent.set_velocity(desired_velocity)

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()
