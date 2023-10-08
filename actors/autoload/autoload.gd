extends Node

signal timeTick
signal pumpThrown(targets,damage)
signal heldChanged
signal died

var heldObject = "":
	get:
		return heldObject
	set(value):
		heldObject = value
		heldChanged.emit()

var numPots := 3
var numSeeded := 0

func _ready():
	spawn()

func _process(_delta):
	if Input.is_action_just_pressed("spawn"):
		spawn()
	if Input.is_action_just_pressed("time"):
		passTime()

func spawn():
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
