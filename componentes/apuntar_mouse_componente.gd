extends Node
class_name ApuntarMouseComponente

@export var sensibilidad: float = 0.01
@export var ejes_invertidos: bool = false

@onready var cabeza: Node3D = Componente.find_ancestor(self, "Node3D")
@onready var cuerpo: CharacterBody3D = Componente.find_ancestor(self, "CharacterBody3D")

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if not (event is InputEventMouseMotion): return
	var mouse_motion := event as InputEventMouseMotion
	
	var pitch: float = -mouse_motion.screen_relative.y
	cabeza.rotate_x(pitch * sensibilidad)
	cabeza.rotation.x = clampf(cabeza.rotation.x, -PI/2, PI/2)
	
	var yaw: float = -mouse_motion.screen_relative.x
	cuerpo.rotate_y(yaw * sensibilidad)
