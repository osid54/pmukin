extends AnimatedSprite2D

func _ready():
	flip_h = randi_range(0,1)
	play("idle")
	$Timer.wait_time = randf_range(1,10)
	$Timer.start()

func _on_timer_timeout():
	play("squish")
	await animation_finished
	play("idle")
	$Timer.wait_time = randf_range(1,10)
