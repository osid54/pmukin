extends AnimatedSprite2D

var enemyType := 1

var frames := ["mushD", "mushS", "mushM", "mushL"]
var offsets := [0, -64, -200, -200]

func _ready():
	play(frames[enemyType]+"idle")
	offset = Vector2(0,offsets[enemyType])

func walkTo(pos: Vector2):
	play(frames[enemyType]+"walk")
	var startPos = position
	var walkSplit := 100
	var walkTime := 2 + randf_range(-.5,.5)
	for i in range(1,walkSplit+1):
		position = startPos.lerp(pos,i*1.0/walkSplit)
		if i == walkSplit:
			break
		await get_tree().create_timer(walkTime/walkSplit).timeout

	play(frames[enemyType]+"idle")
