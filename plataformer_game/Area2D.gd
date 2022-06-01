extends Area2D


export(String, FILE, "*.tscn") var WorldScene





func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(WorldScene)
	pass # Replace with function body.
