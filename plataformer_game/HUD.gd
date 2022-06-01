extends CanvasLayer


func _process(delta):
	$Label_moeda.text = String(Global.Moeda);
	$Label_vida.text = String(Global.Vida);
