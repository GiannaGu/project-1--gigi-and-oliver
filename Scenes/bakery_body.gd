extends CharacterBody2D


const speed = 300.0
const JUMP_VELOCITY = -400.0
@onready var animation = get_node("AnimationPlayer")
@onready var sprite = get_node("BakerySpriteSheet")
@onready var scene = get_tree().get_root().get_node("Game")
@onready var flour = load("res://Scenes/flour_bag.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = speed * direction

	if direction != 0:
		sprite.flip_h = (direction == -1)
	
		update_animations(direction)

	if Input.is_action_just_pressed("ui_flour"):
		flour1(direction, delta)

	

	move_and_slide()


func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animation.play("idle")
		else:
			animation.play("right animation")
	else:
		pass


func flour1(direction, delta):
	var projectile = flour.instantiate()
	if sprite.flip_h == true:
		projectile.direction = -1*((3*PI)/4)
	elif sprite.flip_h == false:
		projectile.direction = 0
	projectile.spawnPosition = global_position
	if sprite.flip_h == true:
		projectile.spawnPosition.x += -10
	elif sprite.flip_h == false:
		projectile.spawnPosition.x += 10
	scene.add_child.call_deferred(projectile)
