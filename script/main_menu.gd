extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	if Input.is_action_just_pressed("Echap"):
		print("Echap")
		get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_start_pressed() -> void:
	print("start")
	get_tree().change_scene_to_file("res://scene/level 1.tscn")

func _on_option_pressed() -> void:
	print("option")
	get_tree().change_scene_to_file("res://scene/menu_option.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
