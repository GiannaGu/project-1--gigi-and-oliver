extends CharacterBody2D

const SPEED = 100.0
var direction
var spawnPosition
var spawnRotation


func _ready():
	position = spawnPosition  # Use local position for Area2D


func _process(delta):
	position += velocity * delta  # Move the projectile manually
	velocity = Vector2(SPEED, 0).rotated(direction)  # Set initial velocity
	if direction > 0:
		velocity += Vector2(0,-9.8) * delta
	else:
		velocity += Vector2(0,9.8) * delta
	move_and_slide() 


func _on_body_entered(body):
	if body.has_method("shoot") == false:
		print("hit")
		queue_free()
