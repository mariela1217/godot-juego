extends Sprite2D

@export var musica_final_nivel: AudioStream

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if musica_final_nivel:
		Musica.cambiar_musica(musica_final_nivel)
