extends AnimatedSprite2D

var enemyType := 1
var health := 1

var frames := ["mushD", "mushS", "mushM", "mushL"]
var offsets := [0, -64, -200, -200]
@onready var heads := [null, $topS, $topM, $topL]

func _ready():
	play(frames[enemyType]+"idle")
	offset = Vector2(0,offsets[enemyType])
	health = enemyType

func walkTo(pos: Vector2):
	play(frames[enemyType]+"walk")
	var startPos = position
	var walkSplit := 100
	var walkTime := 1 + randf_range(-.2,.2)
	for i in range(1,walkSplit+1):
		position = startPos.lerp(pos,i*1.0/walkSplit)
		if i == walkSplit:
			break
		await get_tree().create_timer(walkTime/walkSplit).timeout

	play(frames[enemyType]+"idle")
	return

func hit(dmg: int):
	#print("dmg done: ",dmg)
	health -= dmg

func die():
	self_modulate = Color(1,1,1,0)
	heads[enemyType].offset.y += offsets[enemyType]
	heads[enemyType].visible = true
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK).set_parallel(true)
	tween.tween_property(heads[enemyType],"position",Vector2(0,800),1)
	await get_tree().create_timer(3).timeout
	queue_free()
