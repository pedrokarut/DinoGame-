extends Node2D

var anim

func _ready():
	set_fixed_process(true)
	anim = get_node("Area2D/AnimatedSprite/AnimationPlayer")
	
#makes the rock goes to left when it enters the scene
func _fixed_process(delta):
	var pos = get_pos()
	pos.x -= 200 * delta
	set_pos(pos)

#if it hits the green dino, it explodes
func _on_Area2D_area_enter( area ):
	var nome = area.get_name()
	if "Dis" in nome:
		anim.play("explosion") 
		print(nome)

#playing the sound
func _play_explosion():
	get_node("Som").play("Explosion")
	

#func to check if green dino entered on the collision shape and decreases 
#its life if it hits him and plays the animation 
func _on_Area2D_body_enter( body ):
	var nome = body.get_name()
	if "DinoKine" in nome:
		anim.play("explosion")
		body.get_child(0).get_child(0).play("atingido")
		
		if body.get_parent().get_parent().get_child(13).get_child(0).is_visible():
			body.get_parent().get_parent().get_child(13).get_child(0).hide()
		elif body.get_parent().get_parent().get_child(13).get_child(1).is_visible():
			body.get_parent().get_parent().get_child(13).get_child(1).hide()
		elif body.get_parent().get_parent().get_child(13).get_child(2).is_visible():
			body.get_parent().get_parent().get_child(13).get_child(2).hide()
		else:
			print("END")
		
