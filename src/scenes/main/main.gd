extends Node2D

enum SliceStage {
	START_SCREEN,
	OPENING,
	OPENING_DEFEAT,
	REAL_RUN,
}

@export var opening_duration_seconds: float = 5.0
@export var opening_reset_pause_seconds: float = 1.5

@onready var player = $Player
@onready var boss = $Boss
@onready var pattern_system = $PatternSystem
@onready var player_health_label: Label = $CanvasLayer/PlayerHealthLabel
@onready var boss_health_label: Label = $CanvasLayer/BossHealthLabel
@onready var status_label: Label = $CanvasLayer/StatusLabel

var restart_input_was_pressed: bool = false
var confirm_input_was_pressed: bool = false
var slice_stage: int = SliceStage.START_SCREEN
var stage_timer: float = 0.0
var player_start_position: Vector2 = Vector2.ZERO
var boss_start_position: Vector2 = Vector2.ZERO


func _ready() -> void:
	GameManager.reset_run()
	player_start_position = player.global_position
	boss_start_position = boss.global_position
	_prepare_boot_state()
	_update_hud()
	_update_status_label()


func _process(delta: float) -> void:
	_handle_slice_flow(delta)
	_update_hud()
	_update_status_label()


func _update_hud() -> void:
	var live_player := get_node_or_null("Player")
	var live_boss := get_node_or_null("Boss")

	player_health_label.text = "Player HP: %s/%s" % [_read_health(live_player), _read_max_health(live_player)]

	var boss_phase_text := ""
	if _can_call_method(live_boss, "get_tutorial_phase"):
		boss_phase_text = " | Fase %s" % live_boss.get_tutorial_phase()
	if _can_call_method(live_boss, "can_fire_pattern") and not live_boss.can_fire_pattern():
		boss_phase_text += " | Respawn"

	boss_health_label.text = "Boss HP: %s/%s%s" % [_read_health(live_boss), _read_max_health(live_boss), boss_phase_text]


func _update_status_label() -> void:
	if GameManager.current_state == GameManager.RunState.VICTORY:
		status_label.text = "Vittoria\nPremi R per restart"
		status_label.visible = true
		return

	if GameManager.current_state == GameManager.RunState.GAME_OVER:
		status_label.text = "Game Over\nPremi R per restart"
		status_label.visible = true
		return

	match slice_stage:
		SliceStage.START_SCREEN:
			status_label.text = "Tutorial Boss Slice\nPremi Invio per iniziare"
			status_label.visible = true
		SliceStage.OPENING:
			status_label.text = "Incipit\nMuoviti e schiva.\nLa prima morte e' intenzionale."
			status_label.visible = true
		SliceStage.OPENING_DEFEAT:
			status_label.text = "Il Black Humor ti travolge.\nAdesso inizia lo scontro reale."
			status_label.visible = true
		SliceStage.REAL_RUN:
			status_label.visible = false


func _handle_slice_flow(delta: float) -> void:
	var confirm_just_pressed := InputManager.is_confirm_pressed() and not confirm_input_was_pressed
	var restart_just_pressed := InputManager.is_restart_pressed() and not restart_input_was_pressed

	if GameManager.current_state == GameManager.RunState.BOOT:
		if slice_stage == SliceStage.START_SCREEN and confirm_just_pressed:
			_start_opening_sequence()
		elif slice_stage == SliceStage.OPENING_DEFEAT:
			stage_timer -= delta
			if stage_timer <= 0.0:
				_start_real_run()
	elif GameManager.current_state == GameManager.RunState.PLAYING and slice_stage == SliceStage.OPENING:
		stage_timer -= delta
		if stage_timer <= 0.0:
			_trigger_forced_intro_defeat()
	elif (
		GameManager.current_state == GameManager.RunState.VICTORY
		or GameManager.current_state == GameManager.RunState.GAME_OVER
	) and restart_just_pressed:
		get_tree().reload_current_scene()

	confirm_input_was_pressed = InputManager.is_confirm_pressed()
	restart_input_was_pressed = InputManager.is_restart_pressed()


func _read_health(target) -> int:
	if _can_call_method(target, "get_current_health"):
		return target.get_current_health()
	return 0


func _read_max_health(target) -> int:
	if _can_call_method(target, "get_max_health"):
		return target.get_max_health()
	return 0


func _can_call_method(target, method_name: String) -> bool:
	return target != null and is_instance_valid(target) and target.has_method(method_name)


func _prepare_boot_state() -> void:
	slice_stage = SliceStage.START_SCREEN
	stage_timer = 0.0
	_clear_runtime_bullets()
	player.reset_for_run(player_start_position)
	player.set_firing_enabled(false)
	player.set_damage_blocked(false)
	boss.reset_for_run(boss_start_position)
	GameManager.register_player(player)
	GameManager.register_boss(boss)
	pattern_system.bind_boss(boss)
	pattern_system.set_opening_mode(false)


func _start_opening_sequence() -> void:
	slice_stage = SliceStage.OPENING
	stage_timer = maxf(opening_duration_seconds, 1.0)
	_clear_runtime_bullets()
	player.reset_for_run(player_start_position)
	player.set_firing_enabled(false)
	player.set_damage_blocked(true)
	boss.reset_for_run(boss_start_position)
	GameManager.register_player(player)
	GameManager.register_boss(boss)
	pattern_system.bind_boss(boss)
	pattern_system.set_opening_mode(true)
	GameManager.start_run()


func _trigger_forced_intro_defeat() -> void:
	slice_stage = SliceStage.OPENING_DEFEAT
	stage_timer = maxf(opening_reset_pause_seconds, 0.25)
	GameManager.set_state(GameManager.RunState.BOOT)
	pattern_system.set_opening_mode(false)
	_clear_runtime_bullets()
	player.play_forced_intro_defeat()


func _start_real_run() -> void:
	slice_stage = SliceStage.REAL_RUN
	stage_timer = 0.0
	_clear_runtime_bullets()
	player.reset_for_run(player_start_position)
	player.set_firing_enabled(true)
	player.set_damage_blocked(false)
	boss.reset_for_run(boss_start_position)
	GameManager.register_player(player)
	GameManager.register_boss(boss)
	pattern_system.bind_boss(boss)
	pattern_system.set_opening_mode(false)
	GameManager.start_run()


func _clear_runtime_bullets() -> void:
	for group_name in ["player_bullet", "boss_bullet"]:
		for bullet in get_tree().get_nodes_in_group(group_name):
			if bullet != null and is_instance_valid(bullet):
				bullet.queue_free()
