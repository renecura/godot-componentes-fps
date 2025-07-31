extends Node
class_name ApuntarComponente

@export var sensibilidad: float = 1.0
@export var ejes_invertidos: bool = false

@onready var cabeza : Node3D = Componente.find_ancestor(self, "Node3D")
@onready var cuerpo: CharacterBody3D = Componente.find_ancestor(self, "CharacterBody3D")

func _physics_process(delta: float) -> void:
	var pitch: float = Input.get_axis("apuntar_arriba","apuntar_abajo") * (-1 if ejes_invertidos else 1)
	cabeza.rotate_x(pitch * delta * sensibilidad)
	cabeza.rotation.x = clampf(cabeza.rotation.x, -PI/2, PI/2)
	
	var yaw: float = Input.get_axis("apuntar_derecha","apuntar_izquierda")
	cuerpo.rotate_y(yaw * delta * sensibilidad)
