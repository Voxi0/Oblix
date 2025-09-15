extends Area2D

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Handle movement
	position += velocity * delta

	# Remove bullet once it leaves the screen/viewport
	if not get_viewport_rect().has_point(global_position):
		queue_free()
