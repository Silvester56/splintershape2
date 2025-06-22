extends Node2D

@export var EnemyScene: PackedScene

var arrayOfEnemies = [
	{"x": 18, "y": 6, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.RED_SQUARE},
	{"x": 15, "y": 18, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 1},
	{"x": 18, "y": 22, "behavior": Enemy.Behavior.IDLE, "shape": Shape.Type.RED_SQUARE},
	{"x": 6, "y": 29, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 1, "vision": 270},
	{"x": 58, "y": 58, "behavior": Enemy.Behavior.IDLE, "shape": Shape.Type.RED_SQUARE, "dirX": 0, "dirY": 0, "vision": 90},
	{"x": 53.5, "y": 54, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 0, "dirY": 1, "vision": 180},
	{"x": 69, "y": 60, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 0, "dirY": 1 },
	{"x": 26, "y": 35, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 26, "y": 40, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.BLUE_CROSS},
	{"x": 35, "y": 45, "behavior": Enemy.Behavior.IDLE, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 0, "vision": 180},
	{"x": 45, "y": 45, "behavior": Enemy.Behavior.IDLE, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 0, "dirY": 0, "vision": 180},
	{"x": 5, "y": 41, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 5, "y": 55, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 5, "y": 66, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 8, "y": 69, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.BLUE_CROSS},
	{"x": 17, "y": 69, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 9.5, "y": 60, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 1, "vision": 180},
	{"x": 17.5, "y": 60, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 0, "dirY": 1, "vision": 360},
	{"x": 34, "y": 54, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX" : 1},
	{"x": 29, "y": 57, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 42, "y": 57, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.BLUE_CROSS},
	{"x": 57, "y": 30, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.RED_SQUARE},
	{"x": 69, "y": 35, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 1},
	{"x": 65, "y": 35, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 1},
	{"x": 54, "y": 35, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 1},
	{"x": 50, "y": 25, "behavior": Enemy.Behavior.IDLE, "shape": Shape.Type.RED_SQUARE, "dirX": 0, "dirY": 0, "vision": 90},
	{"x": 50.5, "y": 37, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 0, "dirY": 1, "vision": 360},
	{"x": 29, "y": 5, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.RED_SQUARE},
	{"x": 29, "y": 18, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 42, "y": 18, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.BLUE_CROSS},
	{"x": 69, "y": 19, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 0, "dirY": 1},
	{"x": 69, "y": 16, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 0, "dirY": 1},
	{"x": 69, "y": 13, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 1},
	{"x": 33, "y": 33, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.RED_SQUARE},
	{"x": 33, "y": 38, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.GREEN_TRIANGLE},
	{"x": 38, "y": 33, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.BLUE_CROSS},
	{"x": 38, "y": 38, "behavior": Enemy.Behavior.ROTATE, "shape": Shape.Type.RED_SQUARE},
	{"x": 36, "y": 33, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 1, "dirY": 0, "vision": 270},
	{"x": 36, "y": 38, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 1, "dirY": 0, "vision": 90},
	{"x": 33.5, "y": 36, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 0, "dirY": 1, "vision": 180},
	{"x": 31, "y": 5, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 1, "dirY": 0},
	{"x": 29, "y": 16, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.GREEN_TRIANGLE, "dirX": 0, "dirY": 1},
	{"x": 40, "y": 18, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.BLUE_CROSS, "dirX": 1, "dirY": 0},
	{"x": 42, "y": 7, "behavior": Enemy.Behavior.PATROL, "shape": Shape.Type.RED_SQUARE, "dirX": 0, "dirY": 1},
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
	$GameOver.play()

func _on_goal_body_entered(body: Node2D) -> void:
	$Player/Camera2D/SuccessScreen.show()
	get_tree().paused = true
	$Success.play()
