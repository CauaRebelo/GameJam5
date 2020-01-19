extends TextureProgress

var timer = 0.0

func _ready():
	set_process(true)

func _process(delta):
	timer += delta
	if timer >= 0.5:
		self.value += 5
		timer = 0.0