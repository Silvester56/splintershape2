extends Camera2D

const SCREEN_SIZE = Vector2(768, 768)
var currentScreen = Vector2(0, 0)

func _ready() -> void:
	set_as_top_level(true)
	global_position = get_parent().global_position
	updateScreen(currentScreen)

func _physics_process(_delta: float) -> void:
	var parentScreen : Vector2 = (get_parent().global_position / SCREEN_SIZE).floor()
	if not parentScreen.is_equal_approx(currentScreen):
		updateScreen(parentScreen)

func updateScreen(newScreen : Vector2) -> void:
	currentScreen = newScreen
	global_position = currentScreen * SCREEN_SIZE + SCREEN_SIZE * 0.5
