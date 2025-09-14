extends CharacterBody2D

const speed = 200

func _physics_process(_delta: float) -> void:
	# Movement
	var inputDir = Input.get_vector("left", "right", "up", "down")
	velocity = inputDir * speed
	move_and_slide()
