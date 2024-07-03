extends Node

@export var asteroid_scene: PackedScene
@export var spawn_interval: float = 1.0
@export var spawn_y_position: float = 300

func _ready() -> void:
	randomize()
	_spawn_asteroid()

func _spawn_asteroid() -> void:
	
	while false:
		print(get_node("../UI").isOnPlay)
	
	print("Spawning asteroids...")
	while true:
		# Créer une instance de l'astéroïde
		var asteroid_instance = asteroid_scene.instantiate()
		# Ajouter l'instance à la scène
		add_child(asteroid_instance)
		# Positionner l'astéroïde en bas de l'écran à une position X aléatoire
		var camera_position = get_node("../Camera2D").get_viewport_rect().size
		# Positionne l'astéroïde à une position X aléatoire et à spawn_y_position sur l'axe Y
		var spawn_position = Vector2(randf_range(0, camera_position.x), spawn_y_position)
		asteroid_instance.position = spawn_position
		print("Asteroid spawned at:", asteroid_instance.position)
		# Attendre l'intervalle de spawn avant de continuer
		await get_tree().create_timer(spawn_interval).timeout
