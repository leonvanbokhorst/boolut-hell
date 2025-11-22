extends CharacterBody2D

@export var speed = 150.0
var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		rotation = direction.angle()

func take_damage():
	# print("Enemy: Ouch! I am slain!")
	queue_free()
