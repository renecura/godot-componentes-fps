extends Node
class_name ControlComponente

@export var speed := 8.0

@onready var jugador: CharacterBody3D = Componente.find_ancestor(self, "CharacterBody3D")

func _physics_process(_delta: float) -> void:
	
	if not jugador.is_on_floor():
		return
	
	var movimiento: Vector3
	
	movimiento.x = Input.get_axis("jugador_izquierda","jugador_derecha")
	movimiento.z = Input.get_axis("jugador_avanzar","jugador_retroceder")
	
	movimiento = jugador.transform.basis * movimiento.limit_length() * speed
	
	jugador.velocity.x = movimiento.x
	jugador.velocity.z = movimiento.z
	
