extends Area2D

export (int) var valor

func _on_Heart_body_entered(body):
	if body.is_in_group("player"):
		if Global.health == 4:
			Global.health = 4
		else:
			Global.health += 1
			queue_free()
	
