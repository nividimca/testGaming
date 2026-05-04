extends Node

enum RunState {
	BOOT,
	PLAYING,
	VICTORY,
	GAME_OVER,
}

signal state_changed(new_state: int)

var current_state: int = RunState.BOOT
var player_ref: Node = null
var boss_ref: Node = null


func _ready() -> void:
	set_state(RunState.BOOT)


func set_state(new_state: int) -> void:
	if current_state == new_state:
		return

	current_state = new_state
	state_changed.emit(current_state)


func start_run() -> void:
	set_state(RunState.PLAYING)


func register_player(player: Node) -> void:
	player_ref = player


func register_boss(boss: Node) -> void:
	boss_ref = boss


func is_gameplay_active() -> bool:
	return current_state == RunState.PLAYING


func can_player_fire() -> bool:
	return is_gameplay_active()


func on_player_defeated() -> void:
	set_state(RunState.GAME_OVER)


func on_boss_defeated() -> void:
	set_state(RunState.VICTORY)
