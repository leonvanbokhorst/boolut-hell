extends Area2D

@export var speed = 600.0
var direction = Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name != "Player":
		# We hit something! For now, just disappear.
		# Later we will make it hurt enemies.
		queue_free()

# Destroy bullet if it leaves the screen (optimization)
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

