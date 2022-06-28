extends Node2D

func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://sword.png")
	else:
		$TextureRect.texture = load("res://seeds.png")
