extends KinematicBody2D

onready var animacao = get_node("AnimatedSprite")
onready var coyotetimer = get_node("CoyoteTimer")

var motion:Vector2 = Vector2()
var UP:Vector2 = Vector2.UP

var grav:int = 25
var speed:int = 360
var jump_force:int = 690

var chao:bool = false
var pode_pular:bool = true




func _physics_process(delta):
	
	

	
	if Input.is_action_pressed("ui_end"):
		get_tree().reload_current_scene()
	coyote()
	moviment()
	motion = move_and_slide(motion,UP)
	
func coyote():
	if is_on_floor():
		pode_pular = true
	elif pode_pular == true and coyotetimer.is_stopped():
		coyotetimer.start()
	

func moviment() -> void:
	var dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	motion.x = lerp(motion.x,dir*speed,.1)
	motion.y += grav
	if dir < 0:
		animacao.flip_h = true
	elif dir > 0:
		animacao.flip_h = false
		
	if pode_pular == true:
		if Input.is_action_pressed("ui_up"):
			motion.y = 0
			motion.y -= jump_force
			pode_pular = false
		pass
		
	if Input.is_action_just_released("ui_up"):
		motion.y *= .6
		
	if dir != 0:
		if is_on_floor():
			if not Input.is_action_pressed("ui_up"):
				animacao.play("run")
			print("AGORA")
		else:
			if motion.y > 0:
				animacao.play("fall")
			else:
				animacao.play("jump")
	else:
		if is_on_floor():
			if not Input.is_action_pressed("ui_up"):
				animacao.play("idle")
		else:
			if motion.y > 0:
				animacao.play("fall")
			else:
				animacao.play("jump")
		pass
	pass

func _on_CoyoteTimer_timeout():
	pode_pular = false
	pass # Replace with function body.
