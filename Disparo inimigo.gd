extends Node2D

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var pos = get_pos()
	pos.x -= 350 * delta
	set_pos(pos)
	
	
func _on_Area2D_body_enter( body ):
	var nome = body.get_name()
	if "DinoKine" in nome:
		body.get_child(0).get_child(0).play("atingido")
		
		if body.get_parent().get_parent().get_child(13).get_child(0).is_visible():
			body.get_parent().get_parent().get_child(13).get_child(0).hide()
		elif body.get_parent().get_parent().get_child(13).get_child(1).is_visible():
			body.get_parent().get_parent().get_child(13).get_child(1).hide()
		elif body.get_parent().get_parent().get_child(13).get_child(2).is_visible():
			body.get_parent().get_parent().get_child(13).get_child(2).hide()
		else:
			print("END")
		queue_free()




