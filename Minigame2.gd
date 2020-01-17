extends Node

signal fail
signal win

var enemies = 3 #(totalloop - 1) + 3

func _ready():
	$TotalTimer.start()

func _on_TotalTimer_timeout():
	emit_signal("fail")

func _on_Node2D_wrong():
	emit_signal("fail")
