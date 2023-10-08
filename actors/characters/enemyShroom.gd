extends AnimatedSprite2D

var enemyType := 1
var animSet := false

var frames := ["mushD", "mushS", "mushM", "mushL"]

func _ready():
	pass

func walkTo(pos: Vector2):
	if animSet == true:
		play("walk")
		for i in range(1,6):
			position = position.lerp(pos,i*.2)
		play("idle")
	
func setFrames():
	animSet = true
	set_sprite_frames(load("res://src/animationFrames/"+frames[enemyType]+".tres"))
	print(sprite_frames.get_animation_names())
	play("idle")
