extends Sprite2D

var plantType := 2
var growthLevel := 0

var harvestable := false

var growth := [preload("res://src/sprites/plants/plantS.png"),
	preload("res://src/sprites/plants/plantM.png"),
	preload("res://src/sprites/plants/plantL.png")]
	
var kins := [preload("res://src/sprites/plants/pumpS.png"),
	preload("res://src/sprites/plants/pumpM.png"),
	preload("res://src/sprites/plants/pumpL.png")]
	
var particles := preload("res://actors/effects/particles.tscn")

func _ready():
	Autoload.timeTick.connect(timerUp)
	visible = false

func _process(_delta):
	pass

func timerUp():	
	if growthLevel >= plantType+2:
		return
	if growthLevel == 0:
		visible = true
	if growthLevel < plantType+1:
		texture = growth[growthLevel]
	elif growthLevel == plantType+1:
		texture = kins[plantType]
		harvestable = true
		Autoload.numSeeded -= 1
	growthLevel+=1
	particleSpawn()

func particleSpawn():
	var p = particles.instantiate()
	p.modulate = "GREEN_YELLOW"
	add_child(p)
