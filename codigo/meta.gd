extends Sprite2D

@export var musica_final_nivel: AudioStream
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if musica_final_nivel:
		collision_shape_2d.set_deferred("disabled", true)
		Musica.cambiar_musica(musica_final_nivel)
		get_tree().change_scene_to_file("res://escenas/portada_ganar.tscn")
