extends Node2D
#export (PackedScene) var Cena1_Enemy

signal child
signal adult
signal old

signal defeat
signal win

var speed = 10
var enemy_defeated = 0
var enemy_max = 5
var enemy1 = false
var enemy2 = false
var enemy3 = false



# Called when the node enters the scene tree for the first time.
func _ready():
	$Kogasa.animation = "waiting"
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		$Kogasa.animation = "child"
		emit_signal("child")
		wrongKey()
	if Input.is_action_pressed("ui_down"):
		$Kogasa.animation = "adult"
		emit_signal("adult")
		wrongKey()
	if Input.is_action_pressed("ui_right"):
		$Kogasa.animation = "old"
		emit_signal("old")
		wrongKey()
	if(enemy_defeated == enemy_max):
		emit_signal("win")
		#hide()


#func _on_AttackTimer_timeout():
#	return true



func _on_WaitingTimer_timeout():
	$Kogasa.animation = "waiting"




func _on_EnemySpawn1_hit():
	enemy1 = true
	


func _on_EnemySpawn1_miss():
	emit_signal("defeat")


func _on_EnemySpawn2_hit():
	enemy2 = true


func _on_EnemySpawn2_miss():
	emit_signal("defeat")


func _on_EnemySpawn3_hit():
	enemy3 = true

func _on_EnemySpawn3_miss():
	emit_signal("defeat")
	#hide()

func wrongKey():
	if(enemy1 == false && enemy2 == false && enemy3 == false):
		emit_signal("defeat")
	#	hide() # game over
	enemy1 = false
	enemy2 = false
	enemy3 = false
	enemy_defeated += 1