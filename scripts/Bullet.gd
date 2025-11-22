extends Area2D

@export var speed = 600.0
var direction = Vector2.RIGHT

func _ready():
	# If the sprite is pointing UP by default (which is common), we might need to rotate.
	# But assuming the bullet points RIGHT by default.
	pass

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		return # Don't hit the player (yet)
		
	if body.has_method("take_damage"):
		body.take_damage()
		queue_free()
	else:
		# Hit a wall or something else
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
