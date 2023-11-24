extends KinematicBody2D
class_name player
const PROJECTILE: PackedScene = preload("res://scenes/player/arrow.tscn")
onready var sprite: Sprite = get_node("Texture")
onready var spawn_point: Position2D = get_node("SpawnPoint")

var velocity: Vector2
var can_attack: bool = true


export(int) var gravity_speed

func _physics_process(delta: float) -> void:
	move()
	jump(delta)
	attack()
	velocity = move_and_slide(velocity, Vector2.UP) 
	sprite.animate(velocity)
	
func move() -> void:
	velocity.x = Global.move_speed * get_direction ()
	
func get_direction() -> float :
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")	
	
func attack()	-> void:
	if Input.is_action_just_pressed("ui_attack") and is_on_floor() and can_attack:
		sprite.action_behavior("attack")
		can_attack = false
		
func jump(delta: float) -> void:
	velocity.y += delta * gravity_speed
	
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = -Global.jump_speed

func spawn_projectile() -> void:
	var projectile: Arrow = PROJECTILE.instance()
	get_tree().root.call_deferred("add_child", projectile)
	projectile.direction = sign(spawn_point.position.x)
	projectile.global_position = spawn_point.global_position
	
func update_health(value : int) -> void:
	Global.health -= value
	sprite.action_behavior("hit")
	
	print(Global.health)
	
	if Global.health <= 0:
		var _reload: bool = get_tree().change_scene("res://scenes/management/dead_screen.tscn")
