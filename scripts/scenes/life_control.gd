extends Control

func _process(delta):
	
	$life.value	= Global.health
	$tempo.text = str(Global.tempo)	
func _on_Timer_timeout():
	Global.tempo += 1
