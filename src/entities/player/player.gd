extends Area2D

const BULLET_SCENE := preload("res://src/entities/bullet/bullet.tscn")

@export var move_speed: float = 320.0
@export var fire_interval: float = 0.18
@export var max_health: int = 3
@export var invincible_for_test: bool = true

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var current_health: int = 0
var fire_cooldown: float = 0.0
var firing_enabled: bool = true
var damage_blocked: bool = false


func _ready() -> void:
	current_health = max_health
	add_to_group("player")
	queue_redraw()


func _draw() -> void:
	draw_colored_polygon(
		PackedVector2Array([
			Vector2(0.0, -18.0),
			Vector2(-14.0, 14.0),
			Vector2(14.0, 14.0),
		]),
		Color(0.35, 0.85, 1.0)
	)


func _physics_process(delta: float) -> void:
	if not GameManager.is_gameplay_active():
		return

	fire_cooldown -= delta
	global_position += InputManager.get_move_vector() * move_speed * delta
	_clamp_to_viewport()

	if firing_enabled and InputManager.is_fire_pressed() and fire_cooldown <= 0.0 and GameManager.can_player_fire():
		fire_cooldown = fire_interval
		_fire()


func apply_damage(amount: int) -> void:
	if not GameManager.is_gameplay_active():
		return
	if invincible_for_test:
		return
	if damage_blocked:
		return

	current_health -= amount
	if current_health > 0:
		return

	current_health = 0
	hide()
	_set_collision_enabled(false)
	GameManager.on_player_defeated()


func get_current_health() -> int:
	return current_health


func get_max_health() -> int:
	return max_health


func reset_for_run(spawn_position: Vector2) -> void:
	current_health = max_health
	global_position = spawn_position
	fire_cooldown = 0.0
	firing_enabled = true
	damage_blocked = false
	show()
	_set_collision_enabled(true)
	queue_redraw()


func set_firing_enabled(enabled: bool) -> void:
	firing_enabled = enabled
	if not enabled:
		fire_cooldown = 0.0


func set_damage_blocked(blocked: bool) -> void:
	damage_blocked = blocked


func play_forced_intro_defeat() -> void:
	current_health = 0
	fire_cooldown = 0.0
	hide()
	_set_collision_enabled(false)
	queue_redraw()


func _fire() -> void:
	var bullet := BULLET_SCENE.instantiate()
	var spawn_position := global_position + Vector2(0.0, -24.0)
	var fire_direction := _get_fire_direction_toward_boss(spawn_position)
	bullet.setup(fire_direction, "player", 560.0, 1)
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = spawn_position


func _clamp_to_viewport() -> void:
	var viewport_size := get_viewport_rect().size
	global_position.x = clampf(global_position.x, 24.0, viewport_size.x - 24.0)
	global_position.y = clampf(global_position.y, 24.0, viewport_size.y - 24.0)


func _get_fire_direction_toward_boss(spawn_position: Vector2) -> Vector2:
	if GameManager.boss_ref != null and is_instance_valid(GameManager.boss_ref):
		return (GameManager.boss_ref.global_position - spawn_position).normalized()
	return Vector2.UP


func _set_collision_enabled(enabled: bool) -> void:
	set_deferred("monitoring", enabled)
	set_deferred("monitorable", enabled)
	if collision_shape != null:
		collision_shape.set_deferred("disabled", not enabled)
