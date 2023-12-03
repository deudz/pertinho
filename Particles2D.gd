extends Particles2D

func disapear():
	yield(get_tree().create_timer(5.0), "timeout")
	queue_free()

func _ready():
	disapear()
