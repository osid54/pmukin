extends Node

signal timeTick
signal pumpThrown(targets,damage)
signal heldChanged
signal died
signal loadLevel

var levelNum := 0:
	get:
		return levelNum
	set(value):
		levelNum = value
		loadLevel.emit()

var level := [
			[[1],[1,0,0],[0,0,0,0,1]],
			[[1],[0,1,0],[0,0,0,0,0,2]],
			[[1],[0,0,1],[0,0,0,0,0,0,3]],
			[[2],[2,0,0],[0,0,0,0,2]],
			[[3],[3,0,0],[0,0,0,0,3]],
			[[2],[1,1,0],[0,0,0,0,0,3]],
			[[1],[2,1,0],[0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,2]]
			]

var heldObject = "":
	get:
		return heldObject
	set(value):
		heldObject = value
		heldChanged.emit()

var numPots := 3
var numSeeded := 0

func _ready():
	EnemyController.spawnEnemies(level[levelNum][2])

#func _process(_delta):
#	if Input.is_action_just_pressed("spawn"):
#		spawnRandom()
#	if Input.is_action_just_pressed("time"):
#		passTime()

func spawnRandom():
		var spawnPath = [0,0,0,0]
		for i in 10:
			spawnPath.append(randi_range(0,3))
		EnemyController.spawnEnemies(spawnPath)	

func _on_timer_timeout():
	if numPots == numSeeded:
		passTime()

func throwPumpkin(targ: Array, dmg: Array):
	pumpThrown.emit(targ,dmg)

func passTime():
	timeTick.emit()

func dead():
	died.emit()
