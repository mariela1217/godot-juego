extends AnimationPlayer

func _ready() -> void:
	play("movimiento")
	seek(randf_range(0, get_animation("movimiento").length))
