extends AnimatedSprite2D

func _ready():
	Autoload.died.connect(die)
	flip_h = randi_range(0,1)
	play("idle")
	$Timer.wait_time = randf_range(1,10)
	$Timer.start()

func _on_timer_timeout():
	play("squish")
	await animation_finished
	play("idle")
	$Timer.wait_time = randf_range(1,10)

func die():
	$Timer.stop()
	$ColorRect.visible = true
	play("die")
	var normalCol:=Color8(53,99,42)
	var deadColor:=Color8(244,195,125)
	for i in range(1,26):
		$ColorRect.color = normalCol.lerp(deadColor,i*.6/25)
		await get_tree().create_timer(.6/25).timeout
