extends KinematicBody2D

export (int) var vel = 400
export var particle : PackedScene

var vector = Vector2()

func get_input():
	vector = Vector2()
	if Input.is_action_pressed("ui_right"):
		vector.x += 1
	if Input.is_action_pressed("ui_left"):
		vector.x -= 1
	if Input.is_action_pressed("ui_up"):
		vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		vector.y += 1
	if Input.is_action_just_pressed("ui_accept"):
		yay()
	vector = vector.normalized() * vel
	
func _physics_process(_delta):
	get_input()
	vector = move_and_slide(vector)
	
func yay():
	var _part = particle.instance()
	_part.position = global_position
	_part.emitting = true
	get_tree().current_scene.add_child(_part)
