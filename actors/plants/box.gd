extends Sprite2D

var plantRef : PackedScene = preload("res://actors/plants/plant.tscn")

var plant
var types = ["pumpS","pumpM","pumpL"]
var pointerLoc = [-38,-116,-159]

var inUse := false

func plantSeed(ptype:int):
	var p = plantRef.instantiate()
	p.plantType = ptype
	add_child(p)
	plant = p

func interact():
	if Autoload.heldObject == "":
		if !inUse:
			plantSeed(randi_range(0,2))
			inUse = true
			$plantPointer.visible = false
		else:
			if plant.harvestable:
				Autoload.heldObject = types[plant.plantType]
				plant.queue_free()
				plant = null
				inUse = false
				$cropPointer.visible = false

func areaEntered(_area):
	if Autoload.heldObject == "":
		if !inUse:
			$plantPointer.visible = true
		else:
			if plant.harvestable:
				$cropPointer.position = Vector2(0,pointerLoc[plant.plantType])
				$cropPointer.visible = true

func areaExited(_area):
	$plantPointer.visible = false
	$cropPointer.visible = false
