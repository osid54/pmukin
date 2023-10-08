extends Node

signal timeTick

signal pumpThrown

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
	if Input.is_action_just_pressed("interact"):
		EnemyController.spawnEnemies([0,1,2,1,0,3,1,2,0,1])

func _on_timer_timeout():
	emit_signal("timeTick") 

func throwPumpkin():
	var pump = heldObject
	
	pumpThrown.emit()
