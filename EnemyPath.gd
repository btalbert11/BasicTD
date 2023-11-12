extends Path2D

var enemy_amount = 5
var Blox_follower = preload("res://blox_enemy_follower.tscn")
var Cloud_follower = preload("res://cloud_enemy_follower.tscn")

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
