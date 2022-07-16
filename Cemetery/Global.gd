extends Node

var Vidas:int = 1
var Moedas:int = 0
var Pause:bool = false


func _process(delta):
	
	if Pause == true:
		get_tree().paused = true
	else:
		get_tree().paused = false
		

