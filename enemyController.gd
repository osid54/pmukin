extends Node

var enemyPath = []
var tilePos = [Vector2(243, 778), 
				Vector2(576, 879), 
				Vector2(904, 724), 
				Vector2(1284, 766), 
				Vector2(1650, 864)]
				
var growth := [preload("res://src/sprites/plants/plantS.png"),
	preload("res://src/sprites/plants/plantM.png"),
	preload("res://src/sprites/plants/plantL.png")]

func _ready():
	Autoload.timeTick.connect(moveEnemies)
	for i in 10:
		enemyPath.append(null)
		
func moveEnemies():
	var tempPath = []
	for i in enemyPath.size():
		if i==0:
			if enemyPath[i] != null:
				print("dead")
		else:
			tempPath.append(enemyPath[i])
	enemyPath = tempPath
	for i in 5:
		if enemyPath[i] != null:
			enemyPath[i].walkTo(tilePos[i])
			
func spawnEnemies(path: Array):
	for i in 5:
		if enemyPath[i] != null:
			enemyPath[i].walkTo(tilePos[i])
