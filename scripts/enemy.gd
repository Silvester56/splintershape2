class_name Enemy extends CharacterBody2D

enum Behavior {
	IDLE,
	PATROL,
	ROTATE,
	SLEEPING
}

var currentState: Behavior
var currentShape: Shape.Type
var directionX = 0
var directionY = 0
var forceVisionRotation = 0

const SPEED = 100.0
const isEnemy = true
var sleepingTextVisibleCharacters = 0

func setAttributes(posX, posY, behavior, shape, dX, dY, vision) -> void:
	position.x = posX
	position.y = posY
	currentState = behavior
	currentShape = shape
	directionX = dX
	directionY = dY
	forceVisionRotation = vision

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

func sleep() -> void:
	currentState = Behavior.SLEEPING
	$Sleep.play()

func _on_vision_body_entered(body: Node2D) -> void:
	if currentState != Behavior.SLEEPING and "isPlayer" in body and body.isPlayer and !body.isHidden and body.currentShape != currentShape:
		$"..".gameover()
