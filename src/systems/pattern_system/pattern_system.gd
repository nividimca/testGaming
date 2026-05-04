extends Node

const BULLET_SCENE := preload("res://src/entities/bullet/bullet.tscn")

@export var fire_interval: float = 0.75
@export var bullet_speed: float = 240.0

var fire_cooldown: float = 0.0
var boss_ref: Node2D = null


func bind_boss(boss: Node2D) -> void:
	boss_ref = boss


func _physics_process(delta: float) -> void:
	if not GameManager.is_gameplay_active():
		return
	if boss_ref == null or not is_instance_valid(boss_ref):
		return

	fire_cooldown -= delta
	if fire_cooldown > 0.0:
		return

	fire_cooldown = fire_interval
	_spawn_pattern()


func _spawn_pattern() -> void:
	var directions := [
		Vector2(-0.35, 1.0),
		Vector2(0.0, 1.0),
		Vector2(0.35, 1.0),
	]

	for direction in directions:
		var bullet := BULLET_SCENE.instantiate()
		bullet.setup(direction, "boss", bullet_speed, 1)
		get_tree().current_scene.add_child(bullet)
		bullet.global_position = boss_ref.global_position + Vector2(0.0, 30.0)
