class_name Enemy extends CharacterBody2D

enum Behavior {
	IDLE,
	PATROL,
	ROTATE,
	SLEEPING
}

@export var currentState: Behavior
@export var currentShape: Shape.Type
@export var directionX = 0
@export var directionY = 0
@export var forceVisionRotation = 0

const SPEED = 100.0
const isEnemy = true
var sleepingTextVisibleCharacters = 0

func _ready() -> void:
	$Shape.region_rect = Rect2(Shape.getSpriteOffset(currentShape), 0, 32, 32)
	$Vision/Polygon2D.color = Shape.getVisionColor(currentShape)
	$Speech.add_theme_color_override("font_color", Color($Vision/Polygon2D.color, 1))
	if forceVisionRotation > 0:
		$Vision.rotation = deg_to_rad(forceVisionRotation)

func _physics_process(_delta: float) -> void:
	if currentState == Behavior.PATROL:
		velocity.x = directionX * SPEED
		velocity.y = directionY * SPEED
		if move_and_slide():
			directionX = -directionX
			directionY = -directionY
			if forceVisionRotation == 0:
				$Vision.rotation = $Vision.rotation + deg_to_rad(180)
	elif currentState == Behavior.ROTATE:
		$Vision.rotation = $Vision.rotation + 0.04
	elif currentState == Behavior.SLEEPING:
		sleepingTextVisibleCharacters = sleepingTextVisibleCharacters + 0.05
		$Speech.visible_characters = int(floorf(sleepingTextVisibleCharacters)) % 7
		$Vision.visible = false

func _on_vision_body_entered(body: Node2D) -> void:
	if currentState != Behavior.SLEEPING and "isPlayer" in body and body.isPlayer and !body.isHidden and body.currentShape != currentShape:
		$"..".gameover()
