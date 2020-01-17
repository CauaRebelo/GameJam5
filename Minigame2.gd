extends Node

signal fail
signal win

var enemies = 3 #(totalloop - 1) + 3

func _ready():
	$TotalTimer.start()
	$LossLabel.hide()
	$WinLabel.hide()

func _on_TotalTimer_timeout():
	emit_signal("fail")
	$LossLabel.show()
func _on_Node2D_wrong():
	emit_signal("fail")
	$LossLabel.show()

func _on_Node2D_correct():
	enemies-=1
	if(enemies == 0):
		emit_signal("win")
		$TotalTimer.stop()
		$WinLabel.show()
