extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.play :
		$AnimatedSprite2D.play("default")


func _on_body_entered(body):
	if body.name == "Astéroide":
		get_node("../UI").life -= 1


func _on_area_entered(area):
	if area.name == "Area2DA":
		get_node("../UI").life -= 1
