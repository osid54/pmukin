extends Sprite2D

signal signThrow

func _ready():
	signThrow.connect(Autoload.throwPumpkin)

func interact():
	if ["pumpS","pumpM","pumpL"].has(Autoload.heldObject):
		signThrow.emit()
		Autoload.heldObject = ""

func areaEntered(_area):
	$pointer.visible = true

func areaExited(_area):
	$pointer.visible = false
