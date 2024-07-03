extends RigidBody2D

@export var speed: float = 200.0
@export var amplitude: float = 50.0  # Amplitude of oscillation
@export var frequency: float = 2.0   # Frequency of oscillation
@export var initial_scale: float = 7.0

var initial_position: Vector2
var current_offset: float = 0.0
var direction: int = 1

func _ready():
	initial_position = position
	$AnimatedSprite2D.play("default")


func _process(delta: float) -> void:
	if Global.play :
		print(scale)
		scale = Vector2(initial_scale, initial_scale)
		# Calculate horizontal oscillation
		current_offset += direction * amplitude * delta * frequency
		if abs(current_offset) > amplitude:
			direction *= -1
			current_offset = amplitude * direction

		# Apply vertical movement
		var velocity = Vector2(current_offset, -speed)
		move_and_collide(velocity * delta)




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		
		$AnimatedSprite2D.play("explosion")
		await get_tree().create_timer(0.5).timeout
		Global.points += 1
		self.queue_free()


func _on_area_2d_area_entered(area):
	if area.name == "Coll":
		
		$AnimatedSprite2D.play("explosion")
		Global.points += 1
		await get_tree().create_timer(0.5).timeout
		self.queue_free()
