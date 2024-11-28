extends Camera2D

@export var neededSize: = Vector2()

func _process(_delta):
	var factor := Vector2(get_viewport().get_window().size.x / neededSize.x,
	get_viewport().get_window().size.y / neededSize.y)
	zoom = factor
