extends Button
class_name AudioButton

@export var sonido: AudioStream
@export var esperar_a_final_sonido: bool

signal boton_pulsado

func _init() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	if sonido:
		var ap = load("res://codigo/audio_player.gd").new()
		if esperar_a_final_sonido:
			await ap.play(sonido)
		else:
			ap.play(sonido)
	else:
		print("No hay sonido asignado")

	boton_pulsado.emit()
