extends Node2D

# Information about different towers
@export var tower_1: PackedScene
@export var sniper_tower: PackedScene
@export var morter_tower: PackedScene
@export var sniper_tower_cost: int = 70
@export var tower_1_cost: int = 50
@export var morter_tower_cost: int = 100
# Game state type data
@export var money = 100
@export var lives = 10
# Tracks if last level, sets up game end screen
@export var last_level: int = 5
# Holds a tower while player is tyring to place it
var tower_placement: Node2D
# Track number of enemies and level
var enemies_left: int = 10
var current_level: int = 0
# Script that creates timers to spawn enemies for each level
const Level = preload("res://levels.gd")
var Levels = Level.new()


## NEXT TIME ###
# TODO
# Polish, add sprite for enemy, balance money and levels
# Add end game screen, either for win or for lose at big bad
#


# Called when the node enters the scene tree for the first time.
func _ready():
	# Make sure label matches game value
	update_money_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Handles mouse click for placing tower, bad way to do this, use _unhandled_input
	if Input.is_action_just_pressed("place_tower") and tower_placement != null:
		if tower_placement.over_enemy_path > 0:
			return
		tower_placement.make_active()
		tower_placement = null

# TODO
func _input(event):
	pass
	
func _unhandled_input(event):
	pass
	#TODO
	
# Enemy escaped screen, lose lives/game, update level data
func _on_enemy_escaped_screen():
	lives -= 1
	$Lives.text = str(lives) + " Lives"
	enemies_left -= 1
	print(enemies_left)
	if lives <= 0:
		lose_game()
	if enemies_left <= 0:
		level_end()

# Enemy died, get money, update level data
func _on_enemy_died(enemy_name, money_value):
	money += money_value
	update_money_label()
	enemies_left -= 1
	print("enemies left: " + str(enemy_name) + ", " + str(enemies_left))
	if current_level == last_level && enemies_left <= 0:
		end_game()
	if enemies_left <= 0:
		level_end()

# creates spawn timers that spawn enemies when done. Called by levels script
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
		"Storm":
			spawn_timer.timeout.connect(_on_storm_timer_timeout)
			add_child(spawn_timer)
			spawn_timer.start()
		"BigBad":
			spawn_timer.timeout.connect(_on_big_bad_timer_timeout)
			add_child(spawn_timer)
			spawn_timer.start()
		_:
			print("FATAL ERROR: No Enemy type to spawn")
			get_tree().quit(-1)

# Calls func in path script to spawn a pathFollower with enemy.
# Also pass callback funcs to connect to enemy signals
func _on_blox_timer_timeout():
	%EnemyPath.spawn_blox_enemy(_on_enemy_escaped_screen, _on_enemy_died)

func _on_cloud_timer_timeout():
	%EnemyPath.spawn_cloud_enemy(_on_enemy_escaped_screen, _on_enemy_died)

func _on_storm_timer_timeout():
	%EnemyPath.spawn_storm_enemy(_on_enemy_escaped_screen, _on_enemy_died)
func _on_big_bad_timer_timeout():
	%EnemyPath.spawn_big_bad_enemy(_on_enemy_escaped_screen, _on_enemy_died)

func _on_tower_1_purchase_pressed():
	tower_purchase(tower_1, tower_1_cost)

func _on_sniper_tower_purchase_pressed():
	tower_purchase(sniper_tower, sniper_tower_cost)

func _on_morter_tower_purchase_pressed():
	tower_purchase(morter_tower, morter_tower_cost)

func tower_purchase(tower, tower_cost):
	if tower_placement != null || money < tower_cost:
		return
	money -= tower_cost
	update_money_label()
	var new_tower = tower.instantiate()
	new_tower.position = get_viewport().get_mouse_position()
	add_child(new_tower)
	tower_placement = new_tower

func update_money_label():
	$Money.text = "$" + str(money)

func level_end():
	$NextLevel.visible = true

# Starts the next level by calling levels script.
# Passes the level to start and the spawn timer func to spawn enemies
func _on_next_level_pressed():
	current_level += 1
	enemies_left =  Levels.start_level(current_level, create_spawn_timer)
	print(enemies_left)
	$Level.text = "Level: " + str(current_level)
	$NextLevel.visible = false

func lose_game():
	$Lose.visible = true

func _on_restart_game_pressed():
	get_tree().reload_current_scene()

func end_game():
	print("You win")
	$Win.visible = true
	

