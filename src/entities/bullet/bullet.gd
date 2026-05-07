extends Area2D

var direction: Vector2 = Vector2.ZERO
var faction: String = ""
var move_speed: float = 0.0
var damage_amount: int = 1


func setup(new_direction: Vector2, new_faction: String, new_speed: float, new_damage: int = 1) -> void:
	direction = new_direction.normalized()
	faction = new_faction
	move_speed = new_speed
	damage_amount = new_damage


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	if faction != "":
		add_to_group("%s_bullet" % faction)
	queue_redraw()


func _draw() -> void:
	if faction == "player":
		_draw_player_bullet()
		return

	draw_rect(Rect2(-4.0, -8.0, 8.0, 16.0), Color(1.0, 0.45, 0.45), true)


func _physics_process(delta: float) -> void:
	if not GameManager.is_gameplay_active():
		return

	global_position += direction * move_speed * delta
	_queue_free_if_outside_viewport()


func get_faction() -> String:
	return faction


func _on_area_entered(other: Area2D) -> void:
	if faction == "player" and other.is_in_group("boss") and other.has_method("apply_damage"):
		other.apply_damage(damage_amount)
		queue_free()
	elif faction == "boss" and other.is_in_group("player") and other.has_method("apply_damage"):
		other.apply_damage(damage_amount)
		queue_free()


func _queue_free_if_outside_viewport() -> void:
	var viewport_size := get_viewport_rect().size
	var padding := 64.0

	if global_position.x < -padding:
		queue_free()
	elif global_position.x > viewport_size.x + padding:
		queue_free()
	elif global_position.y < -padding:
		queue_free()
	elif global_position.y > viewport_size.y + padding:
		queue_free()


func _draw_player_bullet() -> void:
	var forward := direction
	if forward == Vector2.ZERO:
		forward = Vector2.UP

	var right := forward.orthogonal().normalized()
	var tail_center := -forward * 8.0
	var tip := forward * 12.0

	var bullet_points := PackedVector2Array([
		tail_center - right * 4.0,
		tail_center + right * 4.0,
		forward * 4.0 + right * 2.5,
		tip,
		forward * 4.0 - right * 2.5,
	])

	draw_colored_polygon(bullet_points, Color(1.0, 0.95, 0.4))
	draw_polyline(bullet_points + PackedVector2Array([bullet_points[0]]), Color(1.0, 1.0, 0.75), 1.5)
