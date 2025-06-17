extends Node2D

func gameover() -> void:
	$Player/Camera2D/GameOverScreen.show()
	get_tree().paused = true
