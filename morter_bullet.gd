extends Node2D

@export var morter_explosion: PackedScene
@export var speed: int = 725
@export var damage: int
@export var rotation_speed: float = 10

var enemy_target: Node2D
var target_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	target_position = enemy_target.global_position
	enemy_target = null
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move to target position
	global_position = global_position.move_toward(target_position, speed * delta)
	rotation += rotation_speed * delta
	# Explode
	if global_position.distance_to(target_position) <= 1:
		var explosion = morter_explosion.instantiate()
		explosion.global_position = global_position
		explosion.set_damage(damage)
		get_parent().call_deferred("add_child", explosion)
		queue_free()

func set_enemy_target(enemy):
	enemy_target = enemy

func set_damage(tower_damage):
	damage = tower_damage

func delete_self():
	queue_free()
