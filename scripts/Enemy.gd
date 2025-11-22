extends CharacterBody2D

@export var speed = 150.0
var player = null

func _ready():
	# Find the player in the scene tree so we can chase them!
	# This assumes the player node is named "Player"
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if player:
		# Calculate direction to player
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		
		# Rotate to face player
		rotation = direction.angle()

func take_damage():
	# Die instantly for now. Later we can add health.
	queue_free()

