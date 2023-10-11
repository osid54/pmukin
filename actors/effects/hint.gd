extends Sprite2D

func _ready():
	Autoload.loadLevel.connect(reset)
	reset()

func _process(_delta):
	if Input.is_action_just_pressed("hint"):
		visible = true

func reset():
	visible = false
	if Autoload.levelNum < Autoload.level.size():
		$numS.frame = Autoload.level[Autoload.levelNum][1][0]
		$numM.frame = Autoload.level[Autoload.levelNum][1][1] 
		$numL.frame = Autoload.level[Autoload.levelNum][1][2] 
	else:
		visible = false
