extends AnimatedSprite2D

@export var speed := 5

func _ready():
	Autoload.heldChanged.connect(changeObj)
	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		interact()
	
func _physics_process(delta):
	var direction := 0
	if Input.is_action_pressed("left"):
		direction = -1
	if Input.is_action_pressed("right"):
		direction = 1
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		direction = 0
	if direction != 0:
		play("walk")
	else:
		play("idle")
	get_parent().progress += direction*speed*delta

func interact():
	var areas = $Area2D.get_overlapping_areas()
	if areas.size() > 0:
		areas[0].get_parent().interact()

func changeObj():
	if Autoload.heldObject == "":
		$heldItem.texture = null
		return
	$heldItem.texture = load("res://src/sprites/plants/"+Autoload.heldObject+".png")
