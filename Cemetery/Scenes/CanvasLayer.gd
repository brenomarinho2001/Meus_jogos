extends CanvasLayer

var pause:int = 1

func _process(delta):
	
	if Input.is_action_just_pressed("ui_esq"):
		pause *= -1
		
		
	
	if pause == -1:
		$Control2.show()
		get_tree().paused = true
	elif pause == 1:
		$Control2.hide()
		get_tree().paused = false
	pass

	
