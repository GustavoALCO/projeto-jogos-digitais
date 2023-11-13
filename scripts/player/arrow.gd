extends Area2D
class_name Arrow

onready var sprite:Sprite = get_node("Texture")
onready var animation: AnimationPlayer = get_node("Animation")

var direction : int = 1
export (int) var speed = 150
export (int) var damage

func _ready() -> void:
	if direction == -1:
		sprite.flip_h = true
		
		
func _physics_process(delta: float) -> void:
	translate(Vector2(delta * direction * speed,0))

func _on_body_entered(body):
	if body is TileMap:
		animation.play("stuck")
		set_physics_process(false)
		yield(get_tree().create_timer(2), "timeout") 
		queue_free() 
	if body is enemy:
		body.update_healph(damage)
		queue_free()


func on_screen_exited() -> void:
	queue_free()



