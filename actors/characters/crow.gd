extends AnimatedSprite2D

func _ready():
	Autoload.loadLevel.connect(reset)
	play("default")

func reset():
	$pointer.visible = false

func interact():
	if Autoload.levelNum < Autoload.level.size():
		$hint.visible = true
		$pointer.visible = false

func _on_area_2d_area_entered(_area):
	if Autoload.levelNum < Autoload.level.size():
		if $hint.visible == false:
			$pointer.visible = true

func _on_area_2d_area_exited(_area):
	$pointer.visible = false
