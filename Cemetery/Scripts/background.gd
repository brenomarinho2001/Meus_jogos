extends Node2D

export(float) var scroll_speed_x = 0.1
export(float) var scroll_speed_y = -0.1

func _ready():
	modulate.a = .3
	$TextureRect.material.set_shader_param("scroll_speed_x", scroll_speed_x)
	$TextureRect.material.set_shader_param("scroll_speed_y", scroll_speed_y)
