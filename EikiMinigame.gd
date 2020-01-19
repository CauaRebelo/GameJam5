extends RigidBody2D

signal hell
signal heaven
signal win

var loss = 0
var win = 0

func _ready():
	$AnimatedSprite.animation = "default"

func _input(event):
	if(win == 0 || loss == 0):
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite.animation = "right"
			emit_signal("heaven")
		if Input.is_action_pressed("ui_left"):
			$AnimatedSprite.animation = "left"
			emit_signal("hell")

func _on_Minigame2_win():
	win = 1
	$AnimatedSprite.animation = "victory"

func _on_Minigame2_fail():
	loss = 1
	$AnimatedSprite.animation = "default"
