extends CanvasLayer

var vida:int
var moedas:int 

func _ready():
	$Control/Obala.bbcode_text= "[wave amp=10 freq=2] Obolos: 0[/wave]"

func _process(delta):
	if moedas != Global.Moedas:
		moedas = Global.Moedas
		$Control/Obala.bbcode_text= "[wave amp=10 freq=2] Obolos:" + str(Global.Moedas) + "[/wave]"
	
	
	
	
	vida = Global.Vidas
	
	match vida:
		
		0:
			$Control/Node2D/vidas3.hide()
			$Control/Node2D/vida2.hide()
			$Control/Node2D/vida.hide()
		
		1:
			$Control/Node2D/vidas3.hide()
			$Control/Node2D/vida2.hide()
		2:
			$Control/Node2D/vidas3.hide()

