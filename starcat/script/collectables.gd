extends Area2D

@export var valeur: int = 1  # Valeur du collectible

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
