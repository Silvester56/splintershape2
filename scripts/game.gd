extends Node2D

@export var EnemyScene: PackedScene

var arrayOfEnemies = [
	{"x": 18, "y": 6, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.RED_SQUARE},
	{"x": 15, "y": 18, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 1},
	{"x": 18, "y": 22, "behavior": Enemy.Behavior.IDLE, "shape": Shape.Type.RED_SQUARE},
	{"x": 6, "y": 29, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 1, "vision": 270},
	]

func _ready() -> void:
	var enemyToAdd
	for e in arrayOfEnemies:
		var dirX = e.dirX if e.has("dirX") else 0
		var dirY = e.dirY if e.has("dirY") else 0
		var vision = e.vision if e.has("vision") else 0
		enemyToAdd = EnemyScene.instantiate()
		enemyToAdd.setAttributes(e.x * 32 + 16, e.y * 32 + 16, e.behavior, e.shape, dirX, dirY, vision)
		add_child(enemyToAdd)

func gameover() -> void:
	$Player/Camera2D/GameOverScreen.show()
	get_tree().paused = true

func _on_goal_body_entered(body: Node2D) -> void:
	$Player/Camera2D/SuccessScreen.show()
	get_tree().paused = true
