extends Area2D

@export var max_health: int = 63
@export var invincible_for_test: bool = true
@export var respawn_on_defeat_for_test: bool = true
@export var respawn_delay_seconds: float = 3.0
@export var phase_move_ranges: Array[float] = [0.0, 48.0, 92.0]
@export var move_frequency: float = 1.35

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var current_health: int = 0
var is_respawning: bool = false
var anchor_position: Vector2 = Vector2.ZERO
var move_time: float = 0.0


func _ready() -> void:
	current_health = max_health
	anchor_position = global_position
	add_to_group("boss")
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(-40.0, -20.0, 80.0, 40.0), Color(0.95, 0.35, 0.35), true)


func _physics_process(delta: float) -> void:
	if not GameManager.is_gameplay_active():
		return
	if is_respawning or not visible:
		return

	move_time += delta
	var phase := get_tutorial_phase()
	var move_range := _get_move_range_for_phase(phase)
	global_position = Vector2(
		anchor_position.x + sin(move_time * move_frequency) * move_range,
		anchor_position.y
	)


func apply_damage(amount: int) -> void:
	if not GameManager.is_gameplay_active():
		return
	if invincible_for_test:
		return
	if is_respawning:
		return

	current_health -= amount
	if current_health > 0:
		return

	current_health = 0
	if respawn_on_defeat_for_test:
		_start_respawn_cycle()
		return

	hide()
	_set_collision_enabled(false)
	GameManager.on_boss_defeated()


func get_tutorial_phase() -> int:
	if is_respawning:
		return 1
	if max_health <= 0:
		return 1

	var phase_health_chunk: int = maxi(int(ceili(float(max_health) / 3.0)), 1)
	if current_health <= phase_health_chunk:
		return 3
	if current_health <= phase_health_chunk * 2:
		return 2
	return 1


func can_fire_pattern() -> bool:
	return not is_respawning and current_health > 0 and visible


func get_current_health() -> int:
	return current_health


func get_max_health() -> int:
	return max_health


func reset_for_run(spawn_position: Vector2) -> void:
	current_health = max_health
	is_respawning = false
	anchor_position = spawn_position
	global_position = spawn_position
	move_time = 0.0
	show()
	_set_collision_enabled(true)
	queue_redraw()


func _start_respawn_cycle() -> void:
	is_respawning = true
	hide()
	_set_collision_enabled(false)

	await get_tree().create_timer(max(respawn_delay_seconds, 0.1)).timeout

	current_health = max_health
	is_respawning = false
	show()
	move_time = 0.0
	_set_collision_enabled(true)


func _get_move_range_for_phase(phase: int) -> float:
	if phase_move_ranges.is_empty():
		return 0.0

	var phase_index := clampi(phase - 1, 0, phase_move_ranges.size() - 1)
	return maxf(phase_move_ranges[phase_index], 0.0)


func _set_collision_enabled(enabled: bool) -> void:
	set_deferred("monitoring", enabled)
	set_deferred("monitorable", enabled)
	if collision_shape != null:
		collision_shape.set_deferred("disabled", not enabled)
