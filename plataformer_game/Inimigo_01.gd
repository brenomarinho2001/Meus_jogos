extends KinematicBody2D

var estados = "idle"
var andar = true

onready var colisao = $Area2D/CollisionShape2D

var velocity = Vector2.ZERO;
export var dir = 1;
var speed = 25;

func _ready():
	$AnimatedSprite.flip_h = true;

func _physics_process(delta):
	
	velocity.x = dir * speed;
	
	if $Ray_right.is_colliding():
		dir = -1
		print("2")
		$AnimatedSprite.flip_h = false;
		
	if $Ray_left.is_colliding():
		dir = 1
		print("1")
		$AnimatedSprite.flip_h = true;
	
	if is_on_floor():
		pass
	else:
		velocity.y += 10
	
	if andar == true:
		velocity = move_and_slide(velocity)
	
	#SWITCH--------------------
	
	match estados:
		
		"idle":
			$AnimatedSprite.play("idle")
			
		"died":
			$AnimatedSprite.play("died")
			andar = false
			colisao.disabled = true
		
			
	


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if position.y > body.position.y:
			estados = "died"
			body.velocity.y = 0
			body.velocity.y -= 300
		else:
			body.estados = "dead"
	
	pass # Replace with function body.
	



func _on_AnimatedSprite_animation_finished():
	if estados == "died":
		queue_free()
		
	pass # Replace with function body.
