extends RigidBody2D


var enemy_types = ["child", "adult", "old"]
var random_number
var exist = true
signal hit
signal miss


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	random_number = randi() % enemy_types.size() 
	$EnemySprite.animation = enemy_types[random_number]
	exist = true
	$AttackTimer.start()
	
func gamb():
	random_number = randi() % enemy_types.size() 
	$EnemySprite.animation = enemy_types[random_number]
	show()
	exist = true
	$AttackTimer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	


func _on_Node2D_child():
	if(random_number == 0):
		emit_signal("hit")
		hide()
		exist = false
		$AttackTimer.stop()
		$CDTimer.start()
		



func _on_Node2D_adult():
	if(random_number == 1):
		emit_signal("hit")
		hide()
		exist = false
		$AttackTimer.stop()
		$CDTimer.start()
		


func _on_Node2D_old():
	if(random_number == 2):
		emit_signal("hit")
		hide()
		exist = false
		$AttackTimer.stop()
		$CDTimer.start()


func _on_CDTimer_timeout():
	gamb()
	


func _on_AttackTimer_timeout():
	emit_signal("miss")
	hide()
	exist = false
	$CDTimer.start() # retirar porque é game over-
