extends Sprite2D

var locations = [.4,.5,.61,.73,.84,1]

func _ready():
	Autoload.pumpThrown.connect(go)

func go():
	get_parent().progress_ratio = 0
	texture = load("res://src/sprites/plants/"+Autoload.heldObject+".png")
	for i in 1000:
		get_parent().progress_ratio += .001
		rotate(TAU/100)
		await get_tree().create_timer(.01).timeout
	texture = null
