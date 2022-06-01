extends KinematicBody2D

onready var poeira = get_node("res://particulas_player.tscn")

#Variaveis de Fisica
var velocity = Vector2.ZERO;

#Variaveis de Controle
var speed = 120;
var forceJump = 300
var gravity = 20

var pode_pular = false
var estados = "idle"

#Dados
onready var anim_player = $Player_animado


func _ready():
	pass
	
func _physics_process(delta):
	
	if Global.Vida == 0:
		pass
	
	
	var dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	#-----MOVIMENTAÇAO--------
	movimentacao(dir)
	
	velocity.y += gravity
	
	if(dir == 1):
		anim_player.flip_h = false
	elif dir == -1:
		anim_player.flip_h = true
	

	velocity = move_and_slide(velocity,Vector2.UP)

	if Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y *= .7

	pass
	
func movimentacao(dir) :
	
	if is_on_floor():
		velocity.x = lerp(velocity.x,dir*speed,.3);
		pode_pular = true
	
		$Timer.start()
	else:
		velocity.x = lerp(velocity.x,dir*speed,.1);
		
		if Input.is_action_just_pressed("ui_up"):
			if pode_pular == true:
				estados = "jump"
				$Timer.start()
		
	

		
	

		

		
	
	match estados:
	
		'idle':
			#print('IDLE')
			
			if !is_on_floor():
				anim_player.play('Jump')
			else:
				anim_player.play('Idle')
				if Input.is_action_pressed("ui_up"):
					estados = 'jump'
				
			
			
			
			#Saindo..
			if dir != 0:
				estados = "run"
			
		'run':
			#print('run')
			
			
			if !is_on_floor():
				anim_player.play('Jump')
			else:
				anim_player.play('Running')
				if Input.is_action_pressed("ui_up"):
					estados = 'jump'
		
			
			
			
			#Saindo..
			if dir == 0:
				estados = "idle"
			
		
		'jump':
			velocity.y = 0;
			velocity.y -= forceJump;
			
			
			if !is_on_floor():
					estados = 'idle'
					pode_pular = false
					
			
			
		'dead':
			anim_player.play('Die')
			velocity.x = 0
			
	#print(estados)
	

	
	
	pass


func _on_Player_animado_animation_finished():
	
	if estados == "dead":
		Global.Vida -= 1;
		get_tree().reload_current_scene()
	
	pass # Replace with function body.


func _on_Timer_timeout():
	pode_pular = false;
	print("UAU")
	pass # Replace with function body.
	
func criando_poeira() :
	pass
