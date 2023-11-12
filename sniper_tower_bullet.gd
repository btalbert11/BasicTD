extends Node2D
@export var enemy_target: Node2D
@export var fade_speed: float = 0.05
@export var damage: int

var r: int = 255
var g: int = 255
var b: int = 255
var a: float = 1

var fading: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Point towards enemy
	rotation = self.global_position.angle_to_point(enemy_target.global_position)
	var rect_length = self.global_position.distance_to(enemy_target.global_position)
	$ColorRect.size.x = rect_length
	# Hit enemy
	enemy_target._on_hurtbox_area_entered($ColorRect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fading:
		a = a - fade_speed
		$ColorRect.color = Color(r, g, b, a)
		if a <= 0:
			queue_free()

func set_enemy_target(enemy):
	enemy_target = enemy

	
func set_damage(tower_damage):
	damage = tower_damage

#Fade out then delete
func delete_self():
	fading = true
