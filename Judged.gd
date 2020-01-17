extends RigidBody2D

signal correct
signal wrong

var hell = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var destinytype = randi()%2+1
	if(destinytype == 1):
		$AnimatedSprite.animation = "hell"
		hell = true
	else:
		$AnimatedSprite.animation = "heaven"
		hell = false
	pass # Replace with function body.

func _on_Eiki_heaven():
	if(hell == false):
		emit_signal("correct")
	else:
		emit_signal("wrong")

func _on_Eiki_hell():
	if(hell == true):
		emit_signal("correct")
	else:
		emit_signal("wrong")
