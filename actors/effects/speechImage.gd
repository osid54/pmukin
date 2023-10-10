extends TextureRect

var images := [preload("res://src/sprites/speech/speechT.png"),
	preload("res://src/sprites/speech/speechS.png"),
	preload("res://src/sprites/speech/speechM.png"),
	preload("res://src/sprites/speech/speechL.png")]

func setImage(eType:int):
	texture = images[eType]
