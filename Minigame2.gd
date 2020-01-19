extends Node2D

signal fail
signal win
signal hell
signal heaven

var enemies = 3 #(totalloop - 1) + 3

const judged = preload("res://Cena2_Enemy.tscn")

func _ready():
	var enemy = judged.instance()
	add_child(enemy)
	connect("fail", enemy, "stopTimer")
	connect("win", enemy, "stopTimer")
	$Eiki.connect("hell", enemy, "_on_Eiki_hell")
	$Eiki.connect("heaven", enemy, "_on_Eiki_heaven")
	enemy.connect("correct", self, "_on_Node2D_correct")
	enemy.connect("wrong", self, "_on_Node2D_wrong")
	$TotalTimer.start()
	$LossLabel.hide()
	$WinLabel.hide()
	$PopupDialog.show()

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
