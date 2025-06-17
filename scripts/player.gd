extends CharacterBody2D

const SPEED = 250.0
const isPlayer = true
var isHidden = false
var currentShape = Shape.type.WHITE_DISK

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("use"):
		if isHidden:
			isHidden = false
			visible = true
		else:
			for body in $Range.get_overlapping_bodies():
				if "isVent" in body and body.isVent:
					isHidden = true
					visible = false
					position = body.position
	if Input.is_action_just_pressed("action"):
		for body in $Range.get_overlapping_bodies():
			if "isEnemy" in body and body.isEnemy:
				if body.currentState == body.EnemyState.SLEEPING:
					currentShape = body.currentShape
					$Shape.region_rect = Rect2(Shape.getSpriteOffset(currentShape), 0, 32, 32)
				else:
					body.currentState = body.EnemyState.SLEEPING
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true;
		$Camera2D/PauseScreen.show()
	var directionX := Input.get_axis("left", "right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directionY := Input.get_axis("up", "down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func _on_continue_pressed() -> void:
	get_tree().paused = false;
	$Camera2D/PauseScreen.hide()

func _on_quit_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_retry_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://scenes/game.tscn")
