extends Node2D

signal timeTick
signal pumpThrown(targets,damage)
signal heldChanged
signal died
signal loadLevel

var levelNum := 16:
	get:
		return levelNum
	set(value):
		levelNum = value
		loadLevel.emit()

var level := [
			[1,[1,0,0],[0,0,1,0,0]],
			[1,[0,1,0],[0,0,0,2,0]],
			[1,[0,0,1],[0,0,0,0,3]],
			[2,[2,0,0],[0,0,2,0,0]],
			[3,[3,0,0],[0,0,3,0,0]],
			[1,[2,0,0],[0,0,1,0,1]],
			[2,[1,1,0],[0,0,0,3,0]],
			[1,[0,1,0],[0,0,0,2,2]],
			[1,[0,0,1],[0,0,0,0,1,1,1,1,3]],
			[2,[1,0,1],[0,0,0,0,3,1]],
			[2,[1,1,1],[0,0,0,0,3,2,0,1]],
			[1,[2,1,0],[0,0,0,1,1,0,0,2]],
			[2,[1,1,0],[0,0,0,1,2,1]],
			[2,[1,1,0],[0,0,0,2,3]],
			[2,[0,2,0],[0,0,0,1,3,2]],
			[2,[3,0,1],[0,0,0,0,3,0,0,3]]
			]

var heldObject = "":
	get:
		return heldObject
	set(value):
		heldObject = value
		heldChanged.emit()

var numPots := 3
var numSeeded := 0
var tickable := true

func _ready():
	position = Vector2()
	loadLevel.connect(setLevel)
	loadLevel.emit()

func setLevel():
	heldObject = ""
	$gameover.visible = false
	if levelNum >= level.size():
		spawnRandom()
	else:
		EnemyController.spawnEnemies(level[levelNum][2])

func _process(_delta):
#	if Input.is_action_just_pressed("spawn"):
#		spawnRandom()
	if Input.is_action_just_pressed("time"):
		if !tickable:
			return
		passTime()
	if Input.is_action_just_pressed("reset"):
		loadLevel.emit()

func spawnRandom():
		var spawnPath = [0,0,0,0]
		for i in 10:
			spawnPath.append(randi_range(0,3))
		EnemyController.spawnEnemies(spawnPath)

func _on_timer_timeout():
	if numPots == numSeeded:
		tickable = false
		passTime()
	else:
		tickable = true

func throwPumpkin(targ: Array, dmg: Array):
	pumpThrown.emit(targ,dmg)
	tickable = false

func passTime():
	timeTick.emit()
	tickable = true

func dead():
	died.emit()
	$gameover.visible = true
