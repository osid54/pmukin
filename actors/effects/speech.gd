extends Node2D

var element = preload("res://actors/effects/speechImage.tscn")

func _ready():
	Autoload.timeTick.connect(reload)
	Autoload.loadLevel.connect(reload)
	reload()

func reload():
	var pathSize := 0
	for object in $Control/bufferhbox/hbox.get_children():
		pathSize += 1
		object.queue_free()
	var tilesUsed := 0
	for enemy in EnemyController.enemyPath:
		var e = element.instantiate()
		if enemy != null:
			e.setImage(enemy.enemyType)
		$Control/bufferhbox/hbox.add_child(e)
		tilesUsed += 1
	while tilesUsed < pathSize:
		var e = element.instantiate()
		$Control/bufferhbox/hbox.add_child(e)
		tilesUsed += 1
