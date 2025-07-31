extends Node
class_name DispararComponente

@export var proyectil_scene: PackedScene
@export var crosshair: Node3D
@export var cadencia: float = 10.0
@export var automatica := false

@onready var cabeza: Node3D = Componente.find_ancestor(self, "Node3D")
@onready var personaje: CharacterBody3D = Componente.find_ancestor(self, "CharacterBody3D")

var _cooldown: float = 0.0

func _physics_process(delta: float) -> void:
	_cooldown = max(_cooldown - delta, 0)
	
	if _cooldown > 0: return
	
	if Input.is_action_pressed("disparar"):
		var proyectil: CharacterBody3D = proyectil_scene.instantiate()
		proyectil.velocity = cabeza.global_transform.basis * Vector3.FORWARD * 100.0
		personaje.add_sibling(proyectil)
		proyectil.global_position = crosshair.global_position
		_cooldown = (1 / cadencia)
		
		
