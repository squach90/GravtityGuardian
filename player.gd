extends CharacterBody2D

@export var max_speed : float = 800.0
@export var acceleration : float = 1000.0

var current_velocity = Vector2.ZERO

func _process(delta: float) -> void:
	if Global.play :
		var mouse_position = get_global_mouse_position()
		
		# Faire en sorte que le vaisseau pointe vers la souris
		var direction = (mouse_position - global_position).normalized()
		rotation = direction.angle()
		
		# Si le bouton de la souris est pressé, accélérer vers la souris
		if Input.is_action_pressed("click"):
			var target_velocity = direction * max_speed
			$AnimatedSprite2D.play("default")
			current_velocity = current_velocity.move_toward(target_velocity, acceleration * delta)
		# Sinon, freiner en appliquant une force dans la direction opposée de la vitesse actuelle
		elif current_velocity.length() > 0:
			var opposite_direction = -current_velocity.normalized()
			$AnimatedSprite2D.play("idle")
			current_velocity = current_velocity.move_toward(Vector2.ZERO, acceleration * delta)
		velocity = current_velocity
		# Appliquer la vélocité mise à jour avec move_and_slide()
		move_and_slide()
