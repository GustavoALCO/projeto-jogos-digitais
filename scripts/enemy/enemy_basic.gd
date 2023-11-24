extends KinematicBody2D
class_name enemy

onready var sprite: Sprite = get_node("Texture")
onready var attack_timer: Timer = get_node("attackCooldown")
onready var animation: AnimationPlayer = get_node("Animation")

var player_ref: KinematicBody2D = null
var velocity: Vector2
var can_deal_damage: bool = true
export(int) var health
export(int) var enemy_damage
export(int) var move_speed
export(int) var distance_threshold
export(float) var attack_cooldown
export(int) var gravity_speed

func _physics_process(delta: float) -> void:
	if player_ref == null:
		return	
		
	velocity.y += delta * gravity_speed
	move()
	velocity = move_and_slide(velocity)
	verify_orientation()
	
	if position.y > 170:
		position.y = -100

func move() -> void: 
	var x_distance: float = player_ref.global_position.x - global_position.x
	var x_direction: float = sign(x_distance)

	if abs(x_distance) < distance_threshold and can_deal_damage:
		player_ref.update_health(enemy_damage)
		attack_timer.start(attack_cooldown)
		can_deal_damage = false
		velocity.x = 0 	
	
	if abs(x_distance) > distance_threshold:
		velocity.x = x_direction * move_speed

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_ref = body

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_ref = null

func _on_attackCooldown_timeout():
	can_deal_damage = true

func update_health(value: int):
	health -= value
	animation.play("hit")
	
	if health <= 0:
		queue_free()

func verify_orientation() -> void:
	
	if velocity.x > 0:
		sprite.flip_h = true

	if velocity.x < 0:
		sprite.flip_h = false


func _on_Animation_animation_finished(_anim_name: String) -> void:
	animation.play("idle")
	set_physics_process(true)

