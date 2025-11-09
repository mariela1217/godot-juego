extends Node
class_name AudioPlayer

func play(audio: AudioStream) -> void:
	if audio:
		var audio_player = AudioStreamPlayer2D.new()
		audio_player.stream = audio
		audio_player.bus = "UI" # puedes cambiarlo a "Master" si no tienes un bus llamado UI
		Engine.get_main_loop().root.add_child(audio_player)
		audio_player.play()
		await audio_player.finished
		audio_player.queue_free()
	else:
		print("Error")
