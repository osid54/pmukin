extends Node2D

func _ready():
	Autoload.died.connect(change)
	Autoload.loadLevel.connect(reset)

func reset():
	$HeartInner.modulate = Color8(175,50,51)

func change():
	var original = $HeartInner.modulate
	#$HeartInner.modulate = "PURPLE"
	var length = 20
	for i in range(1,length+1):
		$HeartInner.modulate = original.lerp(Color8(197,76,134),i*1.0/length)
		await get_tree().create_timer(2.0/length).timeout
