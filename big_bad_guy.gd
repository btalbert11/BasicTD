extends SuperEnemy

var max_health: int

func _ready():
	max_health = health

func take_damage(damage):
	health -= damage
	if health <= max_health * 0.75 && health > max_health * 0.25:
		$FirstSprite.visible = false
		$SecondSprite.visible = true
	if health <= max_health * 0.25:
		$SecondSprite.visible = false
		$ThirdSprite.visible = true
	if health <= 0 && !died:
		enemy_died.emit(enemy_name, money_value)
		died = true
