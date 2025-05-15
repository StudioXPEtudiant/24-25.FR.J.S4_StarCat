extends CharacterBody2D

const SPEED = 350.0
const JUMP_VELOCITY = -700.0
var  max_jumps: int = 1
var jumps_left: int = max_jumps
var max_vie: int = 3
var vie: int = max_vie

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
	
	var collision = move_and_slide()
	
	if collision:
		for i in get_slide_collision_count():
			var collider = get_slide_collision(i).get_collider()
			if collider.is_in_group("Degat"):
				print ("degat")
				prendre_degats(1)
	
	
func prendre_degats(degats: int):
	vie -= degats
	vie = max(vie, 0)
	if vie == 0:
		mourir()

func soigner(soin: int):
	vie += soin
	vie = min(vie, max_vie)  # Empêche de dépasser la vie max
	
func mourir():
	queue_free()
	get_tree().change_scene_to_file("res://scene/test_programmer.tscn")

func _input(event):
	if event.is_action_pressed("degat"):  # Exemple : touche "Entrée"
		prendre_degats(1)
		print("degat")
	elif event.is_action_pressed("ui_cancel"):  # Exemple : touche "Échap"
		soigner(1)
