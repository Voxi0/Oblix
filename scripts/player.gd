extends CharacterBody2D

const SPEED = 200
const BULLET = preload("res://scenes/bullet.tscn")
const BULLET_SPEED: int = 2000

func _physics_process(_delta: float) -> void:
	# Movement
	var inputDir = Input.get_vector("left", "right", "up", "down")
	velocity = inputDir * SPEED
	move_and_slide()

	# Point towards mouse
	look_at(get_global_mouse_position())

	# Fire
	if Input.is_action_just_pressed("fire"):
		fire()

func fire():
	var bullet: Node = BULLET.instantiate()
	bullet.global_position = $Pistol.global_position
	bullet.global_rotation = $Pistol.global_rotation
	bullet.velocity = Vector2.RIGHT.rotated($Pistol.global_rotation) * BULLET_SPEED
	get_tree().current_scene.add_child(bullet)
