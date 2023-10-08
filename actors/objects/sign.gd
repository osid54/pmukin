extends Sprite2D

func interact():
	if ["pumpS","pumpM","pumpL"].has(Autoload.heldObject):
		EnemyController.dmgEnemies(Autoload.heldObject)
		Autoload.heldObject = ""

func areaEntered(_area):
	if ["pumpS","pumpM","pumpL"].has(Autoload.heldObject):
		$pointer.visible = true

func areaExited(_area):
	$pointer.visible = false
