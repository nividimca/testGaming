extends Node

var move_vector: Vector2 = Vector2.ZERO
var fire_pressed: bool = false
var confirm_pressed: bool = false
var restart_pressed: bool = false
var auto_fire_enabled: bool = true


func _process(_delta: float) -> void:
	move_vector = _read_move_vector()
	fire_pressed = auto_fire_enabled or Input.is_key_pressed(KEY_SPACE) or _is_fire_action_pressed()
	confirm_pressed = Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_KP_ENTER)
	restart_pressed = Input.is_key_pressed(KEY_R)


func get_move_vector() -> Vector2:
	return move_vector


func is_fire_pressed() -> bool:
	return fire_pressed


func is_confirm_pressed() -> bool:
	return confirm_pressed


func is_restart_pressed() -> bool:
	return restart_pressed


func _read_move_vector() -> Vector2:
	var x_axis: float = 0.0
	var y_axis: float = 0.0

	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		x_axis -= 1.0
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		x_axis += 1.0
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		y_axis -= 1.0
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		y_axis += 1.0

	return Vector2(x_axis, y_axis).normalized()


func _is_fire_action_pressed() -> bool:
	return InputMap.has_action("fire") and Input.is_action_pressed("fire")
