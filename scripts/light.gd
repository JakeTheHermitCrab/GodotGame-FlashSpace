extends Area2D

var tween: Tween
var shutOffTimer: SceneTreeTimer
var fading := false
var player
signal fade
func _ready():
	hide()
	modulate.a = 1.0
	await get_tree().process_frame  # ensures player exists
	player = get_tree().get_first_node_in_group("player")
	if player:
		player.flashLightSwitch.connect(_on_player_flash_light_switch)
		player.shotGunSwitch.connect(_on_player_shot_gun_switch)
		player.compassSwitch.connect(_on_player_compass_switch)
	
func fadeMask(targetAlpha: float, duration: float):
	if fading:
		return
	fading = true
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "modulate:a", targetAlpha, duration)
	await tween.finished
	if targetAlpha == 0.0:
		modulate.a = 0.0
		Global.voidDeath = 1
		hide()
	fading = false

func showMask():
	if tween:
		tween.kill()
	fading = false
	show()
	modulate.a = 1.0
	if shutOffTimer:
		shutOffTimer = null
	shutOffTimer = get_tree().create_timer(15.0)
	await shutOffTimer.timeout
	if visible:
		fadeMask(0.0, 6.0)

func _on_flash_light_flash_click() -> void:
	showMask()
	$lightSound.play()

func _on_player_flash_light_switch():
	fadeMask(0.0, 1.0)
func _on_player_shot_gun_switch():
	fadeMask(0.0, 1.0)
func _on_player_compass_switch():
	fadeMask(0.0, 1.0)
