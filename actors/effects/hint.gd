extends Sprite2D

func _ready():
	Autoload.loadLevel.connect(reset)

func reset():
	if Autoload.levelNum < Autoload.level.size():
		$numS.frame = Autoload.level[Autoload.levelNum][1][0]
		$numM.frame = Autoload.level[Autoload.levelNum][1][1] 
		$numL.frame = Autoload.level[Autoload.levelNum][1][2] 
	else:
		visible = false
