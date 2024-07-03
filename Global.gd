extends Node

var play = false
var points = 0

func _process(delta):
	if play == false:
		points = 0
