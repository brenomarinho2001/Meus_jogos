extends KinematicBody2D

var motion:Vector2 = Vector2.ZERO
var UP:Vector2 = Vector2.UP
var dir:int = 1
onready var sprite:Node = get_node("AnimatedSprite")
export var speed:int = 150

func _ready():
	if speed < 0:
		sprite.flip_h = false

func _physics_process(delta):
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
			
	
		pass
	motion = move_and_slide(motion,UP)
	

func _on_Area2D_body_entered(body):
	if body.name == "Player" and is_in_group("i_imortais"):
		get_tree().reload_current_scene()

