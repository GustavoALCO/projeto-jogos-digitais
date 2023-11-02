extends KinematicBody2D
class_name player

onready var sprite: Sprite = get_node("Texture")

var velocity: Vector2

export(int) var move_speed
export(int)var jump_speed

export(int) var gravity_speed

func _physics_process(delta: float) -> void:
	move()
	jump(delta)
	velocity = move_and_slide(velocity, Vector2.UP) 
	sprite.animate(velocity)
	
func move() -> void:
	velocity.x = move_speed * get_direction ()
	
func get_direction() -> float :
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")	
	
func jump(delta: float) -> void:
	velocity.y += delta * gravity_speed
	
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = -jump_speed
