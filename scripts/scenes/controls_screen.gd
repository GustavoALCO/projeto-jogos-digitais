extends Control

func _ready():
	$controls/backBtn.grab_focus()
	
	
func _on_confgBtn_pressed():
	get_tree().change_scene("res://scenes/management/startScreen.tscn")
