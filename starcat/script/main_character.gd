extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -275.0
var  max_jumps: int = 1
var jumps_left: int = max_jumps

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
	if Input.is_action_just_pressed("Echap"):
		print("Echap")
		get_tree().change_scene_to_file("res://scene/main_menu.tscn")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left","right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
	if is_on_floor():
		jumps_left = max_jumps
	move_and_slide()
	 
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("Exit"):
			print ("collision EXIT")
	
	if Input.is_action_just_pressed("Sandbox"):
		get_tree().change_scene_to_file("res://scene/test_programmer.tscn")
	
