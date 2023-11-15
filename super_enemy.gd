class_name SuperEnemy
extends Node2D

signal enemy_died(enemy_type, money_value)

@export var health: int
@export var speed: float
@export var money_value: int
@export var enemy_name: String
# To prevent multiple collisions at once
var died: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	health -= damage
	if health <= 0 && !died:
		enemy_died.emit(enemy_name, money_value)
		died = true

func _on_hurtbox_area_entered(area):
	var parent = area.get_owner()
	if parent.is_in_group("Bullets"):
		take_damage(parent.damage)
		parent.delete_self()
