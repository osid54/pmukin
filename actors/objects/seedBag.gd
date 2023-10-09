extends Sprite2D

var menuOpen := false
var seeds = ["seedS", "seedM", "seedL"]
var choiceLoc = [-307,-258,-192]
var selected := -1

func _process(_delta):
	if menuOpen:
		if Input.is_action_just_pressed("up"):
			selected -= 1
			selected = clampi(selected,0,2)
			$choicePointer.position = Vector2(98,choiceLoc[selected])
		elif Input.is_action_just_pressed("down"):
			selected += 1
			selected = clampi(selected,0,2)
			$choicePointer.position = Vector2(98,choiceLoc[selected])
	

func interact():
	if !menuOpen:
		$bagPointer.visible = false
		showOptions()
		return
	if Autoload.heldObject == "":
		Autoload.heldObject = seeds[selected]
		hideOptions()

func showOptions():
	menuOpen = true
	selected = 0
	$choicePointer.position = Vector2(98,choiceLoc[0])
	$SeedOptions.visible = true
	$choicePointer.visible = true
	
func hideOptions():
	menuOpen = false
	$SeedOptions.visible = false
	$choicePointer.visible = false

func areaEntered(_area):
	if Autoload.heldObject == "":
		$bagPointer.visible = true

func areaExited(_area):
	$bagPointer.visible = false
	menuOpen = false
	hideOptions()
