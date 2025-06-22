extends Control

func _ready() -> void:
	for score in Global.savedScores.scores:
		$Label.text = $Label.text + "\n" + score

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
