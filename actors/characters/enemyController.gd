extends Node

var enemyPath = []
var tilePos = [Vector2(243, 778), 
				Vector2(576, 879), 
				Vector2(904, 724), 
				Vector2(1284, 766), 
				Vector2(1650, 864),
				Vector2(2084,887)]
				
var enemies := [null,
	preload("res://actors/characters/enemyShroom.tscn"),
	preload("res://actors/characters/enemyShroom.tscn"),
	preload("res://actors/characters/enemyShroom.tscn")]

func _ready():
	Autoload.timeTick.connect(moveEnemies)
		
func moveEnemies():
	if enemyPath.size() > 0:
		var tempPath = []
		for i in enemyPath.size():
			if i==0:
				if enemyPath[i] != null:
					print("dead")
					enemyPath[i].queue_free()
			else:
				tempPath.append(enemyPath[i])
		enemyPath = tempPath
		while enemyPath.size() < 5:
			enemyPath.append(null)
		for i in 5:
			if enemyPath[i] != null:
				enemyPath[i].walkTo(tilePos[i])
			
func spawnEnemies(path: Array):
	enemyPath.clear()
	for enemyNum in path:
		if enemyNum != 0:
			var e = enemies[enemyNum].instantiate()
			e.enemyType = enemyNum
			e.setFrames()
			add_child(e)
			enemyPath.append(e)
		else:
			enemyPath.append(null)
	for i in 5:
		if enemyPath[i] != null:
			enemyPath[i].position = tilePos[i]
	if enemyPath.size() > 5:
		for i in range(5,enemyPath.size()):
			if enemyPath[i] != null:
				enemyPath[i].position = tilePos[5]
		
