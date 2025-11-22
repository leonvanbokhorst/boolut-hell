extends CharacterBody2D

@export var speed = 300.0

func _physics_process(_delta):
	# Get input direction
	# We will set up these actions in Project Settings -> Input Map
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity = direction * speed
	else:
		# Smoothly stop? Nah, for bullet hell, crisp movement is key!
		velocity = Vector2.ZERO

	move_and_slide()
