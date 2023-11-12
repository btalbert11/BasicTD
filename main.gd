extends Node2D

@export var tower_1: PackedScene
@export var sniper_tower: PackedScene
@export var sniper_tower_cost: int = 70
@export var tower_1_cost: int = 50
@export var money = 100

var tower_placement: Node2D
var lives = 10
var enemies_left: int = 10
var current_level: int = 0


const Level = preload("res://levels.gd")
var Levels = Level.new()

## NEXT TIME
#make bomb type tower
# make big ol' enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Make sure label matches game value
	update_money_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("place_tower") and tower_placement != null:
		if tower_placement.over_enemy_path > 0:
			return
		tower_placement.make_active()
		tower_placement = null

func _input(event):
	pass
	
func _unhandled_input(event):
	pass
	#TODO
	

func _on_enemy_escaped_screen():
	lives -= 1
	$Lives.text = str(lives) + " Lives"
	enemies_left -= 1
	if lives <= 0:
		lose_game()
	if enemies_left <= 0:
		level_end()
	
func _on_enemy_died(enemy_name, money_value):
	money += money_value
	update_money_label()
	enemies_left -= 1
	if enemies_left <= 0:
		level_end()


func create_spawn_timer(value, enemy_type):
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = value
	spawn_timer.one_shot = true
	match (enemy_type):
		"Blox":
			spawn_timer.timeout.connect(_on_blox_timer_timeout)
			add_child(spawn_timer)
			spawn_timer.start()
		"Cloud":
			spawn_timer.timeout.connect(_on_cloud_timer_timeout)
			add_child(spawn_timer)
			spawn_timer.start()

func _on_blox_timer_timeout():
	%EnemyPath.spawn_blox_enemy(_on_enemy_escaped_screen, _on_enemy_died)

func _on_cloud_timer_timeout():
	%EnemyPath.spawn_cloud_enemy(_on_enemy_escaped_screen, _on_enemy_died)

func _on_tower_1_purchase_pressed():
	if tower_placement != null || money < tower_1_cost:
		return
	money -= tower_1_cost
	update_money_label()
	var tower = tower_1.instantiate()
	tower.position = get_viewport().get_mouse_position()
	add_child(tower)
	tower_placement = tower
	

func _on_sniper_tower_purchase_pressed():
	if tower_placement != null || money < sniper_tower_cost:
		return
	money -= sniper_tower_cost
	update_money_label()
	var tower = sniper_tower.instantiate()
	tower.position = get_viewport().get_mouse_position()
	add_child(tower)
	tower_placement = tower

func update_money_label():
	$Money.text = "$" + str(money)

func level_end():
	$NextLevel.visible = true

func _on_next_level_pressed():
	current_level += 1
	$Level.text = "Level: " + str(current_level)
	enemies_left =  Levels.start_level(current_level, create_spawn_timer)
	$NextLevel.visible = false

func lose_game():
	$Lose.visible = true
	

func _on_restart_game_pressed():
	get_tree().reload_current_scene()
