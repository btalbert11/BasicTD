class_name SuperTower
extends Node2D
@export var tower_damage: int
@export var fire_rate: float
@export var active: bool = false
@export var cost: int

@export var bullet_type:PackedScene
var fire_timer: Timer
var targeting_queue = []
var over_enemy_path: int = 0

func _ready():
	# Set up fire cooldown
	fire_timer = Timer.new()
	fire_timer.wait_time = fire_rate
	fire_timer.one_shot = true
	fire_timer.autostart = false
	fire_timer.timeout.connect(fire_at_target)
	add_child(fire_timer)
	
	# Connect signals from child nodes
	tower_connect()

func make_active():
	active = true
	if !targeting_queue.is_empty():
		fire_at_target()
	queue_redraw()

func _process(delta):
	if !active:
		position = get_viewport().get_mouse_position()
	pass

func _on_attack_range_area_entered(area):
	var parent = area.get_owner()
	if parent.is_in_group("Enemies"):
		var final_index = 0
		for i in targeting_queue.size():
			if parent.get_parent().progress_ratio > targeting_queue[i].get_parent().progress_ratio:
				final_index = i+1
		targeting_queue.insert(final_index, parent)
		if fire_timer.time_left <= 0 && active:
			fire_at_target()
		#print(targeting_queue)
		
func _on_attack_range_area_exited(area):
	# Remove enemies from targeting queue
	var parent = area.get_owner()
	if parent.is_in_group("Enemies"):
		for i in targeting_queue:
			if parent == i:
				targeting_queue.erase(i)

func _on_placement_hit_box_area_entered(area):
	if area.is_in_group("Path"):
		over_enemy_path += 1

func _on_placement_hit_box_area_exited(area):
	if area.is_in_group("Path"):
		over_enemy_path -= 1

# Functions to be implemented by inherited classes
func _draw():
	print("NOT IMPLEMENTED")
	pass

func fire_at_target():
	print("NOT IMPLEMENTED")
	pass
	
func tower_connect():
	print("NOT IMPLEMENTED")
	pass
