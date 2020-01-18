extends Node

signal fail
signal win

var enemies = 3 #(totalloop - 1) + 3

const judged = preload("res://Cena1_Enemy.tscn")

func _ready():
	var enemy = judged.instance()
	get_node("Minigame2").add_child(enemy)
	$Minigame2.connect("fail", enemy, "stopTimer")
	$Minigame2.connect("win", enemy, "stopTimer")
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
