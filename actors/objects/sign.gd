extends Sprite2D

func _ready():
	pass # Replace with function body.

func interact():
	if [].has(Autoload.heldObject):
		Autoload.heldObject = ""