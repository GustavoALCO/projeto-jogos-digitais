extends Area2D

export (int) var valor

	
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Global.pontos += valor
		queue_free()
