extends Sprite2D

var menuOpen := false
var seeds = ["seedS", "seedM", "seedL"]
var selected := -1

func interact():
	if !menuOpen:
		$bagPointer.visible = false
		menuOpen = true
		showOptions()
		return
	if Autoload.heldObject == "":
		Autoload.heldObject = seeds[selected]

func showOptions():
	selected = 0
	
func hideOptions():
	pass

func areaEntered(_area):
	$bagPointer.visible = true

func areaExited(_area):
	$bagPointer.visible = false
	menuOpen = false
	hideOptions()
