extends Node2D


func _ready():
	
	Global.resetar_variaveis()


func _on_cair_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is player:
		var _reload: bool = get_tree().change_scene("res://scenes/management/dead_screen.tscn")

func _on_final_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	var _reload: bool = get_tree().change_scene("res://scenes/management/Control.tscn")
	
