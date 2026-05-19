extends CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var player: CharacterBody2D = $"../playerRelated/player"
var speed = 1200.0
var health = 2.0
var damage = 1.0
var time = 0.0
var timeUpdate = 0.9
var played = false
signal died
signal hurt
func _ready():
	add_to_group("enemy")
	var player = get_tree().root.find_child("player", true, false)
	if player:
		self.hurt.connect(player._on_enemy_hurt)

func _physics_process(delta):
	look_at(player.global_position)
	navigation_agent_2d.target_position = player.global_position
	if navigation_agent_2d.is_navigation_finished():
		return
	var next_pos = navigation_agent_2d.get_next_path_position()
	var desired_velocity = (next_pos - global_position).normalized() * 2000
	navigation_agent_2d.set_velocity(desired_velocity)
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		time += delta
		if collider.name == "player":
			if time >= timeUpdate:
				emit_signal("hurt")
				$attack.play()
				time = 0.0


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()

func takeDamage(amount):
	health -= 1.0
	if !played:
		$hurt.play()
		played = true
	if health <= 0:
		emit_signal("died")
		queue_free()
