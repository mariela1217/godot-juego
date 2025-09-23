extends CharacterBody2D

const SPEED := 130.0
const JUMP_VELOCITY := -300.0

var mouse_direction := 0
var jump_requested_by_mouse := false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# click izquierdo → mover a la izquierda mientras se mantenga pulsado
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				mouse_direction = -1
			else:
				mouse_direction = 0

		# click derecho → mover a la derecha mientras se mantenga pulsado
		# y doble click derecho → salto
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				mouse_direction = 1
				if event.double_click:
					jump_requested_by_mouse = true
			else:
				mouse_direction = 0

func _physics_process(delta: float) -> void:
	# gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# prioridad: teclado si hay input, si no usar mouse
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 0 and mouse_direction != 0:
		direction = mouse_direction

	# movimiento horizontal
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	# salto por teclado (ej: tecla espacio)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# salto por doble click derecho
	if jump_requested_by_mouse:
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		jump_requested_by_mouse = false

	# aplicar movimiento
	move_and_slide()
