extends Area2D

@export var max_health: int = 20
@export var invincible_for_test: bool = true

var current_health: int = 0


func _ready() -> void:
	current_health = max_health
	add_to_group("boss")
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(-40.0, -20.0, 80.0, 40.0), Color(0.95, 0.35, 0.35), true)


func apply_damage(amount: int) -> void:
	if not GameManager.is_gameplay_active():
		return
	if invincible_for_test:
		return

	current_health -= amount
	if current_health > 0:
		return

	current_health = 0
	GameManager.on_boss_defeated()
	queue_free()
