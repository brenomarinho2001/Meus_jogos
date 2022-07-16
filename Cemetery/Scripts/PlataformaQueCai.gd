extends KinematicBody2D

var estados
var cair:bool = false
var p_x  
var p_y
var reiniciar:bool = false
var timer:bool = false
var shake:bool = false


func _ready():
	p_y = position.y 
	$AnimationPlayer.play("on")

func _physics_process(delta):
	if cair == true:
		if timer == false:
			$Timer.start(.0)
			cair = false
			timer = true
		print(cair)
		

	
	pass




func _on_Timer_timeout():

	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("off")
	$Sprite/Particles2D.hide()
	$Timer2.start(1)
	$Timer.stop()

	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.motion.y > 0 or body.motion.y == 0:
		$AnimationPlayer.play("tremer")


	
	pass # Replace with function body.




func _on_Timer2_timeout():
	print("Oi")
	timer = false
	$CollisionShape2D.disabled = false
	$AnimationPlayer.play("on")
	#$Sprite/Particles2D.show()
	$Timer2.stop()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "afundar":
		$AnimationPlayer.play("tremer")
	
	if anim_name == "tremer":
		cair = true
	pass # Replace with function body.
