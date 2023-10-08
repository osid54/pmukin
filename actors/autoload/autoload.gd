extends Node

signal timeTick

signal pumpThrown(targets,damage)

signal heldChanged()
var heldObject = "":
	get:
		return heldObject
	set(value):
		heldObject = value
		heldChanged.emit()

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("spawn"):
		EnemyController.spawnEnemies([0,1,2,1,0,3,1,2,0,1])
	if Input.is_action_just_pressed("time"):
		emit_signal("timeTick") 

#func _on_timer_timeout():
#	emit_signal("timeTick") 

func throwPumpkin(targ: Array, dmg: Array):
	pumpThrown.emit(targ,dmg)
