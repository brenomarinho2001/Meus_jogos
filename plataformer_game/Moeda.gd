extends Area2D

var estados = "ativo"

func _process(delta):
	
	match estados:
		
		"ativo":
			
			pass
			
		"desativo":
			$AnimatedSprite.play("desativo")
			
			pass

func _on_Moeda_body_entered(body):
	Global.Moeda += 1
	estados = "desativo"
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if estados == "desativo":
		queue_free()
	pass # Replace with function body.
