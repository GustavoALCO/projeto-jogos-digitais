extends Control

func _ready():
	$controls/restartBtn.grab_focus()

func _on_restartBtn_pressed():
	get_tree().change_scene("res://scenes/management/startScreen.tscn")


func _on_exitBtn_pressed():
	get_tree().quit()
