extends SuperTower

# Need to edit for sniper
func fire_at_target():
	if !targeting_queue.is_empty():
		var enemy = targeting_queue.back()
		var bullet = bullet_type.instantiate()
		bullet.set_enemy_target(enemy)
		bullet.set_damage(tower_damage)
		bullet.position = position
		get_parent().call_deferred("add_child", bullet) # don't want to tie to tower
		fire_timer.start(fire_rate)

func tower_connect():
	$AttackRange.area_entered.connect(_on_attack_range_area_entered)
	$AttackRange.area_exited.connect(_on_attack_range_area_exited)
	$PlacementHitbox.area_entered.connect(_on_placement_hit_box_area_entered)
	$PlacementHitbox.area_exited.connect(_on_placement_hit_box_area_exited)

func _draw():
	if !active:
		var center = Vector2(($ColorRect.size.x/2), ($ColorRect.size.y/2))
		var radius = $AttackRange/CollisionShape2D.shape.radius
		var color = Color.LIGHT_SKY_BLUE
		color.a = 0.5
		
		draw_circle(center, radius, color)
