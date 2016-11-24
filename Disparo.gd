extends Node2D
var anim

func _ready():
	set_fixed_process(true)
	anim = get_node("Disparo/AnimatedSprite/AnimationPlayer")
	
func _fixed_process(delta):
	anim.play("disparo")
	var pos = get_pos()
	pos.x += 350 * delta
	set_pos(pos)

#check if the red dino has been hit and if it has been hit plays 
#the animation and decreses the life number 
func _on_Disparo_area_enter( area ):
	var nome = area.get_name()
		
	if "Area" in nome:
		queue_free()
	
	#it cleans the soot if it hits the enemy shoot
	if "DisparoInimigo" in nome:
		queue_free()
	
	if "Enemy2D" in nome:
		if area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(0).is_visible():
			area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(0).hide()
		elif area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(1).is_visible():
			area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(1).hide()
		elif area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(2).is_visible():
			area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(2).hide()
		elif area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(3).is_visible():
			area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(3).hide()
		elif area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(4).is_visible():
			area.get_parent().get_parent().get_parent().get_parent().get_child(14).get_child(4).hide()
			area.get_parent().get_child(0).get_child(1).get_child(0).play("morrer")
			area.get_parent().get_parent().get_parent().get_parent().get_child(18).show()
			get_tree().set_pause(true)



