extends RigidBody2D

signal correct
signal wrong

var hell = true
var spawned = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()

func spawn():
	randomize()
	var destinytype = randi()%2+1
	if(destinytype == 1):
		$AnimatedSprite.animation = "hell"
		hell = true
	else:
		$AnimatedSprite.animation = "heaven"
		hell = false
	show()
	spawned = true

func _on_Eiki_heaven():
	if(spawned == true):
		if(hell == false):
			emit_signal("correct")
			spawned = false
			hide()
			$SpawnTimer.start()
		else:
			emit_signal("wrong")
			spawned = false

func _on_Eiki_hell():
	if(spawned == true):
		if(hell == true):
			spawned = false
			hide()
			$SpawnTimer.start()
			emit_signal("correct")
		else:
			emit_signal("wrong")
			spawned = false

func _on_SpawnTimer_timeout():
	spawn()

func stopTimer():
	$SpawnTimer.stop()
	hide()