extends Object
class_name Componente

static func find_ancestor(componente: Node, type: String) -> Node:
	var ancestro := componente.get_parent()
	
	while ancestro != componente.get_tree().root:
		if ancestro.is_class(type):
			return ancestro
		ancestro = ancestro.get_parent()
		
	printerr("Ancestro %s no encontrado para componente %s" % [type, componente.name])
	return null

#func find_ancestor(type: String) -> Node:
	#var ancestro := get_parent()
	#
	#while ancestro != get_tree().root:
		#if ancestro.is_class(type):
			#return ancestro
		#ancestro = ancestro.get_parent()
		#
	#printerr("Ancestro %s no encontrado para componente %s" % [type, name])
	#return null
