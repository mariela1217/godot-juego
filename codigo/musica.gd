extends Node

var audio_player: AudioStreamPlayer

func _ready() -> void:
	audio_player = AudioStreamPlayer.new()
	audio_player.bus = "Music"
	add_child(audio_player)

func cambiar_musica(nueva_musica: AudioStream) -> void:
	# Si no hay audio player (por si algo raro pasa), lo crea de nuevo
	if not audio_player:
		audio_player = AudioStreamPlayer.new()
		add_child(audio_player)
	
	# Si ya está sonando la misma música, no la reinicia
	if audio_player.stream == nueva_musica and audio_player.playing:
		return
	
	audio_player.stop()
	audio_player.stream = nueva_musica
	audio_player.play()
