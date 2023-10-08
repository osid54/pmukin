extends Node

var enemyPath = []
var tilePos = [Vector2(243, 842), 
				Vector2(576, 943), 
				Vector2(904, 788), 
				Vector2(1284, 830), 
				Vector2(1650, 928),
				Vector2(2084,935)]
				
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
		
