extends RayCast3D
class_name DispararRayComponente

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("disparar") and is_colliding():
		print(get_collision_point())
