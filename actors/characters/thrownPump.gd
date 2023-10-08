extends Sprite2D

var locations = [.4,.5,.61,.73,.84,1]

func _ready():
	Autoload.pumpThrown.connect(go)

func go(targ: Array, dmg: Array):
	var end = locations[targ[-1]]
	get_parent().progress_ratio = 0
	texture = load("res://src/sprites/plants/"+Autoload.heldObject+".png")
	for i in end*1000:
		get_parent().progress_ratio += .001
		rotate(TAU/100)
		
		var pos
		for l in locations.size():
			if get_parent().progress_ratio >= locations[l]:
				pos = l
		for j in targ.size():
#			if targ[j] != -1:
#				print("t: ",targ[j]," p: ",pos)
			if pos == targ[j]:
				EnemyController.enemyPath[pos].hit(dmg[j])
#				print("did damage ",dmg[j])
				targ[j] = -1
		await get_tree().create_timer(.005).timeout
	texture = null
