extends KinematicBody2D
class_name enemy


onready var atack_timer: Timer	= get_node("attackCooldown")
var player_ref: KinematicBody2D = null
var velocity: Vector2
var can_deal_damage: bool = true
export(int)var enemy_damage
export(int)var move_speed
export(int)var distance_threshold
export(float)var attack_cooldown

func _physics_process(delta: float) -> void:
	if player_ref == null:
		return	
			
	move()
	velocity = move_and_slide(velocity)
func move() -> void: 
	var x_distance: float =  player_ref.global_position.x - global_position.x
	var x_direction: float = sign(x_distance)
	if abs(x_distance) < distance_threshold and can_deal_damage:
		player_ref.update_health(enemy_damage)
		atack_timer.start(attack_cooldown)
		can_deal_damage = false
		velocity.x = 0 	
		
		
	if abs(x_distance) > distance_threshold :
		velocity.x = x_direction * move_speed
	
	
func _on_body_entered(body):
	if body is player:
		player_ref = body


func _on_body_exited(body):
	if body is player:
			player_ref = null


func _on_attackCooldown_timeout():
	can_deal_damage = true
