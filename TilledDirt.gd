extends StaticBody2D

func interact():
	var replacer = preload("res://TilledDirt.tscn").instance()
	replacer.position = self.position
	get_tree().get_root().add_child(replacer)
 
func _physics_process(delta):
	pass
