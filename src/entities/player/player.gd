extends Area2D

const BULLET_SCENE := preload("res://src/entities/bullet/bullet.tscn")

@export var move_speed: float = 320.0
@export var fire_interval: float = 0.18
@export var max_health: int = 3
@export var invincible_for_test: bool = true

var current_health: int = 0
var fire_cooldown: float = 0.0


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

	if InputManager.is_fire_pressed() and fire_cooldown <= 0.0 and GameManager.can_player_fire():
		fire_cooldown = fire_interval
		_fire()


func apply_damage(amount: int) -> void:
	if not GameManager.is_gameplay_active():
		return
	if invincible_for_test:
		return

	current_health -= amount
	if current_health > 0:
		return

	current_health = 0
	GameManager.on_player_defeated()
	queue_free()


func _fire() -> void:
	var bullet := BULLET_SCENE.instantiate()
	bullet.setup(Vector2.UP, "player", 560.0, 1)
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position + Vector2(0.0, -24.0)


func _clamp_to_viewport() -> void:
	var viewport_size := get_viewport_rect().size
	global_position.x = clampf(global_position.x, 24.0, viewport_size.x - 24.0)
	global_position.y = clampf(global_position.y, 24.0, viewport_size.y - 24.0)
