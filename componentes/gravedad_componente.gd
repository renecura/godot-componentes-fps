extends Node
class_name GravedadComponente

@export var g: float = 9.8

@onready var cuerpo: CharacterBody3D = Componente.find_ancestor(self, "CharacterBody3D")

func _physics_process(delta: float) -> void:
	cuerpo.velocity.y -= g * delta
	if cuerpo.is_on_floor():
		cuerpo.velocity.y = 0
	
