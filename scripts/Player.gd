extends CharacterBody2D

@export var speed = 300.0
@export var bullet_scene: PackedScene

func _physics_process(_delta):
	# Movement
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
	
	# Shooting
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	if bullet_scene:
		var bullet = bullet_scene.instantiate()
		# Spawn bullet at player position
		bullet.position = position
		# Set direction towards mouse
		var mouse_pos = get_global_mouse_position()
		var direction_to_mouse = (mouse_pos - position).normalized()
		bullet.direction = direction_to_mouse
		# Rotate bullet to face direction
		bullet.rotation = direction_to_mouse.angle()
		
		# Add bullet to the root of the scene tree, not the player
		# If we add it to the player, it will move with the player!
		get_tree().root.add_child(bullet)
