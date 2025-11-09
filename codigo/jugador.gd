extends CharacterBody2D

const SPEED := 130.0
const JUMP_VELOCITY := -340.0
@onready var sonido_salto: AudioStreamPlayer2D = $SonidoSalto
@onready var sonido_caminar: AudioStreamPlayer2D = $SonidoCaminar

var mouse_direction := 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# click izquierdo → mover a la izquierda mientras se mantenga pulsado
		if event.button_index == MOUSE_BUTTON_LEFT:
			mouse_direction = -1 if event.pressed else 0

		# click derecho → mover a la derecha mientras se mantenga pulsado
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			mouse_direction = 1 if event.pressed else 0

		# click en la ruedita → salto (solo si está en el piso)
		elif event.button_index == MOUSE_BUTTON_MIDDLE and event.pressed:
			if is_on_floor():
				velocity.y = JUMP_VELOCITY 
				sonido_salto.play()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 0 and mouse_direction != 0:
		direction = mouse_direction

	if direction != 0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
		if not sonido_caminar.playing:
			sonido_caminar.play()
	else:
		velocity.x = 0
		if sonido_caminar.playing:
			sonido_caminar.stop()

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sonido_salto.play()

	move_and_slide()
