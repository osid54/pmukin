extends Node

signal timeTick

signal heldChanged()
var heldObject = "":
	get:
		return heldObject
	set(value):
		heldObject = value
		heldChanged.emit()

#""
#"seed[SML]"
#"pump[SML]"
#"water"

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		EnemyController.spawnEnemies([0,1,0,1,0,1,1,1,0,1])

func _on_timer_timeout():
	emit_signal("timeTick") 
