extends Node2D

var anim

func _ready():
	set_fixed_process(true)
	anim = get_node("Area2D/AnimatedSprite/AnimationPlayer")
	
func _fixed_process(delta):
	var pos = get_pos()
	pos.x -= 200 * delta
	set_pos(pos)


func _on_Area2D_area_enter( area ):
	var nome = area.get_name()
	anim.play("explosion") 
	print(nome)

func _on_Area2D_body_enter( body ):
	var nome = body.get_name()
	print("Colidiu com a rocha: " + nome)
	anim.play("explosion")
	
func _play_explosion():
	get_node("Som").play("Explosion")
	
