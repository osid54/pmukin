extends Node

var enemyPath = []

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
