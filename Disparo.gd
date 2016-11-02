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


func _on_Disparo_area_enter( area ):
	var nome = area.get_name()
	print("Colidiu com o disparo: " + nome)
	if "Area" in nome:
		queue_free()
	
