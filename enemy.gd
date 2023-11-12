extends Node2D

signal enemy_died(enemy_type, money_value)

@export var health: int = 3
@export var speed: float = 0.1
@export var money_value: int = 5
@export var enemy_name: String = "Blox"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	health -= damage
	if health <= 0:
		enemy_died.emit(enemy_name, money_value)
		get_owner().delete_self()


func _on_hurtbox_area_entered(area):
	var parent = area.get_owner()
	if parent.is_in_group("Bullets"):
		take_damage(parent.damage)
		parent.delete_self()
