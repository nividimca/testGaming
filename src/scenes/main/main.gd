extends Node2D

@onready var player: Area2D = $Player
@onready var boss: Area2D = $Boss
@onready var pattern_system: Node = $PatternSystem


func _ready() -> void:
	GameManager.register_player(player)
	GameManager.register_boss(boss)
	pattern_system.bind_boss(boss)
	GameManager.start_run()
