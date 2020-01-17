extends RigidBody2D

signal hell
signal heaven
signal win

func _ready():
	$AnimatedSprite.animation = "default"

func _input(event):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "right"
		emit_signal("heaven")
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "left"
		emit_signal("hell")

