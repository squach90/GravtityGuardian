extends CanvasLayer

@export var points = 0
@export var life = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.visible = true
	Global.points = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Menu/AnimatedSprite2D.play("default")
	$InGame/ScoreLabel.text = str(Global.points)
	$GameOver/HighScoreLabel.text = "High Score : " + str(Global.points)
	if life == 0 :
		$GameOver.visible = true
		$InGame.visible = false
		$Menu.visible = false
		Global.play = false


func _on_play_button_pressed():
	Global.play = true
	print(Global.play)
	$Menu.visible = false
	$InGame.visible = true


func _on_quit_button_pressed():
	get_tree().quit()
