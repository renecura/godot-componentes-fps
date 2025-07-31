extends Node
class_name SaltarComponente

@export var fuerza: float = 6.0

@onready var personaje: CharacterBody3D = Componente.find_ancestor(self, "CharacterBody3D")

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("saltar") and personaje.is_on_floor():
		personaje.velocity.y = fuerza
