class_name Shape

enum Type {
	WHITE_DISK,
	RED_SQUARE,
	GREEN_TRIANGLE,
	BLUE_CROSS
}

static func getSpriteOffset(s: Type) -> int:
	if s == Type.WHITE_DISK:
		return 0
	elif s == Type.RED_SQUARE:
		return 32
	elif s == Type.GREEN_TRIANGLE:
		return 64
	else:
		return 96

static func getVisionColor(s: Type) -> Color:
	if s == Type.WHITE_DISK:
		return Color(1, 1, 1, 0.5)
	elif s == Type.RED_SQUARE:
		return Color(1, 0, 0, 0.5)
	elif s == Type.GREEN_TRIANGLE:
		return Color(0, 1, 0, 0.5)
	else:
		return Color(0, 0, 1, 0.5)
