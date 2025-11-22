extends Area2D

@export var speed = 600.0
var direction = Vector2.RIGHT

func _ready():
	# print("Bullet spawned!") # Clean up logs
	pass

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	# print("Bullet hit something: ", body.name)
	
	if body.name == "Player":
		return # Don't hit the player
		
	if body.has_method("take_damage"):
		# print("Bullet: Hitting enemy!")
		body.take_damage()
		queue_free()
	else:
		# print("Bullet: Hit wall/obstacle, destroying self")
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
