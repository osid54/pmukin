extends Sprite2D

func interact():
	if Autoload.heldObject == "":
		Autoload.heldObject = "waterCan"
