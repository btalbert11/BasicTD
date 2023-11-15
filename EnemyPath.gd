extends Path2D

var Blox_follower = preload("res://blox_enemy_follower.tscn")
var Cloud_follower = preload("res://cloud_enemy_follower.tscn")
var Storm_follower = preload("res://storm_enemy_follower.tscn")
var BigBad_follower = preload("res://big_bad_enemy_follower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_blox_enemy(escaped_callback_func, died_callback_func):
	var enemy = Blox_follower.instantiate()
	enemy.escaped_screen.connect(escaped_callback_func)
	enemy.enemy_died.connect(died_callback_func)
	add_child(enemy)

func spawn_cloud_enemy(escaped_callback_func, died_callback_func):
	var enemy = Cloud_follower.instantiate()
	enemy.escaped_screen.connect(escaped_callback_func)
	enemy.enemy_died.connect(died_callback_func)
	add_child(enemy)

func spawn_storm_enemy(escaped_callback_func, died_callback_func):
	var enemy = Storm_follower.instantiate()
	enemy.escaped_screen.connect(escaped_callback_func)
	enemy.enemy_died.connect(died_callback_func)
	add_child(enemy)

func spawn_big_bad_enemy(escaped_callback_func, died_callback_func):
	var enemy = BigBad_follower.instantiate()
	enemy.escaped_screen.connect(escaped_callback_func)
	enemy.enemy_died.connect(died_callback_func)
	add_child(enemy)
