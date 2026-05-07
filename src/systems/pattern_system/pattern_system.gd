extends Node

const BULLET_SCENE := preload("res://src/entities/bullet/bullet.tscn")

@export var opening_fire_interval: float = 1.2
@export var opening_bullet_speed: float = 210.0
@export var phase_fire_intervals: Array[float] = [1.0, 0.85, 1.0]
@export var phase_bullet_counts: Array[int] = [1, 3, 5]
@export var phase_bullet_speeds: Array[float] = [235.0, 255.0, 280.0]
@export var phase_spread_degrees: Array[float] = [0.0, 16.0, 12.0]
@export var phase_burst_counts: Array[int] = [1, 1, 2]
@export var burst_interval: float = 0.18

var fire_cooldown: float = 0.0
var boss_ref: Node2D = null
var current_phase: int = 1
var opening_mode: bool = false
var bursts_remaining: int = 0
var burst_cooldown: float = 0.0


func bind_boss(boss: Node2D) -> void:
	boss_ref = boss
	current_phase = _resolve_current_phase()
	_reset_attack_timers()


func set_opening_mode(enabled: bool) -> void:
	opening_mode = enabled
	_reset_attack_timers()


func _physics_process(delta: float) -> void:
	if not GameManager.is_gameplay_active():
		return
	if boss_ref == null or not is_instance_valid(boss_ref):
		return
	if not _can_boss_fire_pattern():
		return

	if opening_mode:
		_process_opening_pattern(delta)
		return

	var resolved_phase := _resolve_current_phase()
	if resolved_phase != current_phase:
		current_phase = resolved_phase
		_reset_attack_timers()

	if bursts_remaining > 0:
		burst_cooldown -= delta
		if burst_cooldown > 0.0:
			return

		bursts_remaining -= 1
		burst_cooldown = maxf(burst_interval, 0.05)
		_spawn_pattern(current_phase)
		return

	fire_cooldown -= delta
	if fire_cooldown > 0.0:
		return

	fire_cooldown = _get_fire_interval_for_phase(current_phase)
	_spawn_pattern(current_phase)
	bursts_remaining = _get_burst_count_for_phase(current_phase) - 1
	burst_cooldown = maxf(burst_interval, 0.05)


func _spawn_pattern(phase: int) -> void:
	var bullet_count := _get_bullet_count_for_phase(phase)
	var spread_step := deg_to_rad(_get_spread_for_phase(phase))
	var bullet_speed := _get_bullet_speed_for_phase(phase)
	_spawn_spread(bullet_count, spread_step, bullet_speed)


func _process_opening_pattern(delta: float) -> void:
	fire_cooldown -= delta
	if fire_cooldown > 0.0:
		return

	fire_cooldown = maxf(opening_fire_interval, 0.1)
	_spawn_spread(1, 0.0, opening_bullet_speed)


func _resolve_current_phase() -> int:
	if boss_ref != null and boss_ref.has_method("get_tutorial_phase"):
		return boss_ref.get_tutorial_phase()
	return 1


func _can_boss_fire_pattern() -> bool:
	if boss_ref != null and boss_ref.has_method("can_fire_pattern"):
		return boss_ref.can_fire_pattern()
	return true


func _get_fire_interval_for_phase(phase: int) -> float:
	var phase_index := clampi(phase - 1, 0, max(phase_fire_intervals.size() - 1, 0))
	if phase_fire_intervals.is_empty():
		return 0.75
	return maxf(phase_fire_intervals[phase_index], 0.1)


func _get_bullet_count_for_phase(phase: int) -> int:
	var phase_index := clampi(phase - 1, 0, max(phase_bullet_counts.size() - 1, 0))
	if phase_bullet_counts.is_empty():
		return 1

	var bullet_count: int = maxi(phase_bullet_counts[phase_index], 1)
	if bullet_count % 2 == 0:
		bullet_count += 1
	return bullet_count


func _get_bullet_speed_for_phase(phase: int) -> float:
	if phase_bullet_speeds.is_empty():
		return 240.0

	var phase_index := clampi(phase - 1, 0, phase_bullet_speeds.size() - 1)
	return maxf(phase_bullet_speeds[phase_index], 1.0)


func _get_spread_for_phase(phase: int) -> float:
	if phase_spread_degrees.is_empty():
		return 0.0

	var phase_index := clampi(phase - 1, 0, phase_spread_degrees.size() - 1)
	return maxf(phase_spread_degrees[phase_index], 0.0)


func _get_burst_count_for_phase(phase: int) -> int:
	if phase_burst_counts.is_empty():
		return 1

	var phase_index := clampi(phase - 1, 0, phase_burst_counts.size() - 1)
	return maxi(phase_burst_counts[phase_index], 1)


func _get_target_direction() -> Vector2:
	if GameManager.player_ref != null and is_instance_valid(GameManager.player_ref):
		var player_delta: Vector2 = GameManager.player_ref.global_position - boss_ref.global_position
		if player_delta.length_squared() > 0.001:
			return player_delta.normalized()
	return Vector2.DOWN


func _spawn_spread(bullet_count: int, spread_step: float, bullet_speed_value: float) -> void:
	var base_direction := _get_target_direction()
	if bullet_count <= 1:
		_spawn_bullet(base_direction, bullet_speed_value)
		return

	var center_index := float(bullet_count - 1) / 2.0
	for index in range(bullet_count):
		var angle_offset := (float(index) - center_index) * spread_step
		_spawn_bullet(base_direction.rotated(angle_offset), bullet_speed_value)


func _spawn_bullet(direction: Vector2, bullet_speed_value: float) -> void:
	var bullet := BULLET_SCENE.instantiate()
	bullet.setup(direction, "boss", bullet_speed_value, 1)
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = boss_ref.global_position + Vector2(0.0, 30.0)


func _reset_attack_timers() -> void:
	fire_cooldown = maxf(_get_fire_interval_for_phase(current_phase), 0.1)
	if opening_mode:
		fire_cooldown = maxf(opening_fire_interval, 0.1)
	bursts_remaining = 0
	burst_cooldown = 0.0
