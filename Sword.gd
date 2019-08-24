extends Area2D

func _physics_process(delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if not body.is_a_parent_of(self) and "health" in body:
			body.queue_free()

func _on_Timer_timeout() -> void:
	queue_free()
