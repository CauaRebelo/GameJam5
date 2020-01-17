extends Node2D
export (PackedScene) var Cena1_Enemy

signal hit
var speed = 10
var enemy_num = 0
var enemy_weakness = 1 # Trocar enemy weakness por acesso do random_number do objeto mob



# Called when the node enters the scene tree for the first time.
func _ready():
	$SpawnTimer.start()
	$Kogasa.animation = "waiting"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		$Kogasa.animation = "child"
		attack(1)
	if Input.is_action_pressed("ui_up"):
		$Kogasa.animation = "adult"
		attack(2)
	if Input.is_action_pressed("ui_right"):
		$Kogasa.animation = "old"
		attack(3)
		
	
func attack(type):
	if(type == 1): # alterar porque mudei pra testar
		emit_signal("hit") # Sinal para eliminar o mob
		enemy_num -= 1
		$HitTimer.start()
	else:
		$MissTimer.start()
	#	emit_signal("fail") # retirar hp 
		enemy_num -= 1

func _on_SpawnTimer_timeout():
	if(enemy_num <= 3):
		var enemy = Cena1_Enemy.instance()
		add_child(enemy)
		enemy_num +=1 
		


#func _on_AttackTimer_timeout():
#	return true



func _on_WaitingTimer_timeout():
	$Kogasa.animation = "waiting"


func _on_HitTimer_timeout():
	$Kogasa.animation = "hit"
	


func _on_MissTimer_timeout():
	$Kogasa.animation = "miss"
