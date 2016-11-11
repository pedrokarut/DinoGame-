extends Node2D

var animdino
var disparo = preload("res://Scenes/Disparo.tscn")
var rocha = preload("res://Scenes/Rocha.tscn")
var dino_pos
var enemyshot = preload("res://Scenes/Disparo inimigo.tscn")
var nivel2 = false

func _ready():
	animdino = get_node("Dino/DinoKine/AnimatedSprite/AnimationPlayer")
	set_fixed_process(true)
	var dino_pos = get_node("Dino/Position2D")
	get_node("lblLevel").set_text("LEVEL 1")
	
	
func _fixed_process(delta):
	
	dino_pos = get_node("Dino/DinoKine/CollisionShape2D").get_global_pos()
	
func _on_Rocha_timeout():
	var nova_rocha = rocha.instance(true)
	add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(1100, rand_range(5, 550)))


func _on_Disparo_timeout():
	dino_pos = get_node("Dino/DinoKine/CollisionShape2D").get_global_pos()
	
	if Input.is_action_pressed("shoot"):
		dino_pos = get_node("Dino/DinoKine/CollisionShape2D").get_global_pos()
		var novo_disp = disparo.instance(true)
		animdino.play("cuspir fogo")
		add_child(novo_disp)
		novo_disp.set_pos(Vector2(dino_pos.x + 20, dino_pos.y - 13))



func _on_Timer_Nvel_2_timeout():
	get_node("Rocha").stop()
	get_node("Timer Nível 2/Rocha level2").start()
	get_node("lblLevel").set_text("LEVEL 2")


func _on_Rocha_level2_timeout():
	var nova_rocha = rocha.instance(true)
	add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(1100, rand_range(5, 550)))


func _on_Timer_Nvel_3_timeout():
	get_node("Timer Nível 2").stop()
	get_node("Timer Nível 2/Rocha level2").stop()
	get_node("lblLevel").set_text("LEVEL 3")
	get_node("Timer Nível 3/Rocha level 3").start()
	

func _on_Rocha_level_3_timeout():
	var nova_rocha = rocha.instance(true)
	add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(1100, rand_range(5, 550)))
	

func _on_Remove_Meteoros_area_enter( area ):
	area.get_parent().queue_free()
	get_node("Castle Life").set_value(get_node("Castle Life").get_value() - 5)
	
	if get_node("Castle Life").get_value() == 0:
		get_tree().set_pause(true)
		get_node("PanelGameOver").show()


func _on_Enemy_Shoot_timeout():
	var novo_shoot = enemyshot.instance(true)
	novo_shoot.set_scale(Vector2(0.2, 0.2))
	var enemypos = get_node("Enemy/Path2D/PathFollow2D/Area2D/CollisionShape2D").get_global_pos()
	novo_shoot.set_pos(Vector2(enemypos.x - 100, enemypos.y - 40))
	add_child(novo_shoot)
