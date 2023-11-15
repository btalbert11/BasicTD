extends PathFollow2D

var progress_speed: float
signal escaped_screen
signal enemy_died(enemy_name, money_value)

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_speed = $Blox.speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += progress_speed * delta
	if progress_ratio >= 1:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	emit_signal("escaped_screen")
	delete_self()

func _on_blox_enemy_died(enemy_type, money_value):
	enemy_died.emit(enemy_type, money_value)
	delete_self()

func delete_self():
	queue_free()
