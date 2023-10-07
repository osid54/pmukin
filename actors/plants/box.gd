extends Sprite2D

var plantRef : PackedScene = preload("res://actors/plants/plant.tscn")

var plant
var types = ["pumpS","pumpM","pumpL"]

var inUse := false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

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
		else:
			if plant.harvestable:
				Autoload.heldObject = types[plant.plantType]
				plant.queue_free()
				plant = null
				inUse = false
