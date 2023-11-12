extends Node2D
@export var enemy_target: Node2D
@export var speed: int = 10
@export var damage: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_target != null:
		look_at(enemy_target.global_position)
		global_position.x = move_toward(global_position.x, enemy_target.global_position.x, speed)
		global_position.y = move_toward(global_position.y, enemy_target.global_position.y, speed)
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
