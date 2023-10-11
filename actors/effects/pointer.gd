extends AnimatedSprite2D

@export var col = "basic"

var basic = Color(1,1,1,1)

var plant = Color8(25,54,40)
var bag = Color8(53,99,42)
var choice = Color8(162,191,94)
var crow = Color8(37,65,100)
var throw = Color8(129,39,55)
var pump = Color8(201,119,67)

func _ready():
	play("default")
	modulate = get(col)
