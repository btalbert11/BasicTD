extends Node2D

@export var enemy_target: Node2D
@export var speed: int = 1000
@export var damage: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_target != null:
		look_at(enemy_target.global_position)
		# TODO If I ever want to change this, a better way to do it would be 
		# To spawn a path from tower to enemy, update the path endpoint to be
		# always at enemy target, and then have the bullet follow that path.
		global_position = global_position.move_toward(enemy_target.global_position, speed*delta)
		#global_position.y = move_toward(global_position.y, enemy_target.global_position.y, speed)
	else:
		queue_free()

func _physics_process(delta):
	pass
	
func set_enemy_target(enemy):
	enemy_target = enemy

func set_damage(tower_damage):
	damage = tower_damage

func delete_self():
	queue_free()
