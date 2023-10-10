extends Node2D

var element = preload("res://actors/effects/speechImage.tscn")

func _ready():
	Autoload.timeTick.connect(reload)
	reload()

func reload():
	for object in $Control/bufferhbox/hbox.get_children():
		object.queue_free()
	for enemy in EnemyController.enemyPath:
		var e = element.instantiate()
		if enemy != null:
			e.setImage(enemy.enemyType)
		$Control/bufferhbox/hbox.add_child(e)
