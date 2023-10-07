extends Node

signal timeTick

signal heldChanged()
var heldObject = "":
	get:
		return heldObject
	set(value):
		heldChanged.emit()
		heldObject = value

#""
#"seed[SML]"
#"pump[SML]"
#"water"

func _ready():
	pass

func _process(_delta):
	pass

func _on_timer_timeout():
	emit_signal("timeTick") 
