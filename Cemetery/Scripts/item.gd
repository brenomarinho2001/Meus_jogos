extends Area2D


func _on_Item_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("collected")
		$AnimatedSprite.scale = Vector2(3,3)
		$AnimatedSprite.position.y -= 30
		Global.Moedas += 1
		pass
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "collected":
		queue_free()
		pass
	
	pass # Replace with function body.
