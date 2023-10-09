extends Sprite2D

var plantRef : PackedScene = preload("res://actors/plants/plant.tscn")

var plant
var types = ["pumpS","pumpM","pumpL"]
var seeds = {"seedS":0,"seedM":1,"seedL":2}
var pointerLoc = [-74,-116,-159]

var inUse := false

func plantSeed(ptype:int):
	var p = plantRef.instantiate()
	p.plantType = ptype
	add_child(p)
	plant = p
	Autoload.heldObject = ""

func interact():
	if seeds.has(Autoload.heldObject) and !inUse:
		plantSeed(seeds[Autoload.heldObject])
		inUse = true
		$plantPointer.visible = false
		Autoload.numSeeded += 1 
		return
	if Autoload.heldObject == "" and inUse and plant.harvestable:
		Autoload.heldObject = types[plant.plantType]
		plant.queue_free()
		plant = null
		inUse = false
		$cropPointer.visible = false

func areaEntered(_area):
	if seeds.has(Autoload.heldObject) and !inUse:
		$plantPointer.visible = true
	if Autoload.heldObject == "" and inUse and plant.harvestable:
		$cropPointer.position = Vector2(0,pointerLoc[plant.plantType])
		$cropPointer.visible = true

func areaExited(_area):
	$plantPointer.visible = false
	$cropPointer.visible = false
