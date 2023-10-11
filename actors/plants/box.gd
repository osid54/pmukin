extends Sprite2D

var plantRef : PackedScene = preload("res://actors/plants/plant.tscn")

var plant
var types = ["pumpS","pumpM","pumpL"]
var seeds = {"seedS":0,"seedM":1,"seedL":2}
var pointerLoc = [-74,-116,-159]
@export var boxNum := 0

var inUse := false

func _ready():
	Autoload.loadLevel.connect(reset)
	if Autoload.levelNum < Autoload.level.size():
		if boxNum <= Autoload.level[Autoload.levelNum][0]:
			visible = true
		else:
			visible = false
	else:
		visible = true

func reset():
	if plant != null:
		plant.queue_free()
		plant = null
	inUse = false
	$cropPointer.visible = false
	$plantPointer.visible = false
	if  Autoload.levelNum >= Autoload.level.size() or boxNum <= Autoload.level[Autoload.levelNum][0]:
		visible = true
	else:
		visible = false

func plantSeed(ptype:int):
	var p = plantRef.instantiate()
	p.plantType = ptype
	add_child(p)
	plant = p
	Autoload.heldObject = ""

func interact():
	if visible:
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
	if visible:
		if seeds.has(Autoload.heldObject) and !inUse:
			$plantPointer.visible = true
		if Autoload.heldObject == "" and inUse and plant.harvestable:
			$cropPointer.position = Vector2(0,pointerLoc[plant.plantType])
			$cropPointer.visible = true

func areaExited(_area):
	$plantPointer.visible = false
	$cropPointer.visible = false
