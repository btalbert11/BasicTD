extends Node2D

@export var damage: int
@export var fade_time: float = 1.8
@export var explosion_radius: float = 100

var exploded: bool = false
var fade_alpha = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/CollisionShape2D.shape.radius = explosion_radius
	_draw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if exploded:
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		damage = 0
	fade_alpha -= fade_time * delta
	queue_redraw()
#	if fade_alpha <= 0.95:
#		$Area2D/CollisionShape2D.set_deferred("disabled", true)
	if fade_alpha <= 0.85:
		fade_time = 3.2
	if fade_alpha <= 0.01:
		queue_free()

func _draw():
	var center = Vector2(0, 0)
	var radius = explosion_radius
	var color = Color.WHITE_SMOKE
	color.a = fade_alpha
	draw_circle(center, radius, color)
		
func set_damage(tower_damage):
	damage = tower_damage

func delete_self():
	exploded = true
	pass
