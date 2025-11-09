extends CanvasLayer

@export var escena_a_cargar: PackedScene

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_boton_comenzar_pressed() -> void:
	if escena_a_cargar:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene_to_packed(escena_a_cargar)
	else:
		print("Error: no hay escena asignada")

func _on_boton_salir_pressed() -> void:
	get_tree().quit()
