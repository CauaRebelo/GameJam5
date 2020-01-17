extends RigidBody2D


var enemy_types = ["child", "adult", "old"]
var random_number


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	random_number = randi() % enemy_types.size() 
	$EnemySprite.animation = enemy_types[random_number]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	


func _on_Node2D_hit():
	queue_free()
