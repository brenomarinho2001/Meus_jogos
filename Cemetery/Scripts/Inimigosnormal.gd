extends KinematicBody2D

var motion = Vector2.ZERO
var UP = Vector2.UP
var dir = 1

onready var sprite = get_node("AnimatedSprite")

export var speed:int = 150
export var impact:int = 800

func _ready():
	if speed == 0:
		sprite.play("sleep")
	if speed < 0:
		sprite.flip_h = false


func _physics_process(delta):
	
	sprite.scale.x = lerp(sprite.scale.x,2,.1)
	motion.y += 10
	
	# ------- Se tiver no chão---------
	if is_on_floor():
		# ------- COLISOR DIREITO ATIVAR -----
		if $RayRight.is_colliding():
			# MUDA DIREÇÃO E FLIPA
			speed *= -1
			sprite.flip_h = false
			
		# -------- COLISOR ESQUERDO ATIVAR ----
		elif $RayEsq.is_colliding():
			# MUDA DIREÇÃO E FLIPA
			speed *= -1
			sprite.flip_h = true

		#ADICIONANDO VELOCIDADE
		motion.x = speed
	motion = move_and_slide(motion,UP)
	

func _on_Area2D_body_entered(body):
	#SE ALTURA DO PLAYER É MAIOR
	if body.name == "Player":
		
		#SE ALTURA DO PLAYER É MAIOR
		if int(body.global_position.y)+32 < int($Bater.global_position.y):
			
			var forca = body.motion.y
			print(forca)
			
			body.motion.y = 0
			body.motion.y -= impact
			sprite.scale.x = 2.4
			sprite.play("sleep")
			speed = 0
		
		else:
			if $AnimatedSprite.animation != "sleep":
				get_tree().reload_current_scene()
	pass

