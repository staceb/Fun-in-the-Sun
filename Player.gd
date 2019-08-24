extends KinematicBody2D

var facing_direction = "down"
var attacking = false

func _physics_process(delta: float) -> void:
	var input_direction = Vector2.ZERO
	input_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	var velocity = input_direction.normalized() * 96
	move_and_slide(velocity)

	if input_direction.x > 0:
		facing_direction = "right"
	if input_direction.x < 0:
		facing_direction = "left"
	if input_direction.y > 0:
		facing_direction = "down"
	if input_direction.y < 0:
		facing_direction = "up"

	if not input_direction && not attacking:
		$AnimationPlayer.play("idle_" + facing_direction)
	elif not attacking:
		$AnimationPlayer.play("walk_" + facing_direction)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		attacking = true
		$AnimationPlayer.play("attack_" + facing_direction)

func finished_attacking():
	attacking = false