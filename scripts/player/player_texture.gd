extends Sprite
class_name PlayerTexture

onready var animation: AnimationPlayer = get_node("%Animation")

func animate(velocity: Vector2) -> void:
	verify_orientation(velocity.x)
	
	if velocity.y != 0:
		vertical_behavior(velocity.y)
		return
		
	horizontal_behaivor(velocity.x)

func verify_orientation(speed: float) -> void:
	if speed > 0:
		flip_h = false
		return
	if speed < 0:
		flip_h = true
		
func vertical_behavior(speed: float) -> void:
	if speed > 0:
		animation.play("fall")
		
	if speed < 0:
		animation.play("jump")

func horizontal_behaivor(speed: float) -> void:
	if speed != 0:
		animation.play("run")
		return
	animation.play("idle")
