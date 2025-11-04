extends AudioStreamPlayer2D

func cambiar_musica(musica: AudioStream) -> void:
	stream = musica
	play()
