extends Control

func _ready():
	$controls/startBtn.grab_focus()


func _on_startBtn_pressed():
	get_tree().change_scene("res://scenes/management/game_level.tscn")


func _on_confgBtn_pressed():
	get_tree().change_scene("res://scenes/management/controlsScreen.tscn")

func _on_exitBtn_pressed():
	get_tree().quit()
