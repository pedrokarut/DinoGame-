extends Node2D

#these variables are used to intance another scenes
var animdino
var disparo = preload("res://Scenes/Disparo.tscn")
var rocha = preload("res://Scenes/Rocha.tscn")
var enemy = preload("res://Scenes/Enemy.tscn")
var dino_pos
var enemyshot = preload("res://Scenes/Disparo inimigo.tscn")
var nivel2 = false

func _ready():
	get_tree().set_pause(false)
	animdino = get_node("Dino/DinoKine/AnimatedSprite/AnimationPlayer")
	set_fixed_process(true)
	var dino_pos = get_node("Dino/Position2D")
	get_node("lblLevel").set_text("LEVEL 1") #setting the level name
	
	
func _fixed_process(delta):
	
	#check if the third life is gone, if it is true, the game stops
	if get_node("Dino Vida/Dino Vida 3").is_hidden():
		get_node("PanelGameOver").show()
		get_tree().set_pause(true)
		get_node("Rochas Geradas").hide()
		
#func to create new rocks and add them at a random place
func _on_Rocha_timeout():
	var nova_rocha = rocha.instance(true)
	add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(1100, rand_range(5, 550)))


#func to create new shoots from the green dino using its position
func _on_Disparo_timeout():
	dino_pos = get_node("Dino/DinoKine/CollisionShape2D").get_global_pos()
	
	if Input.is_action_pressed("shoot"):
		dino_pos = get_node("Dino/DinoKine/CollisionShape2D").get_global_pos()
		var novo_disp = disparo.instance(true)
		animdino.play("cuspir fogo")
		add_child(novo_disp)
		novo_disp.set_pos(Vector2(dino_pos.x + 20, dino_pos.y - 13))


#func to increse the number of rocks on the level 2 
func _on_Timer_Nvel_2_timeout():
	get_node("Rocha").stop()
	get_node("Timer Nível 2/Rocha level2").start()
	get_node("lblLevel").set_text("LEVEL 2")


#func to increse the quantity of rocks when level 2 starts
func _on_Rocha_level2_timeout():
	var nova_rocha = rocha.instance(true)
	add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(1100, rand_range(5, 550)))

#func to start level 3 and stop the leve 2
func _on_Timer_Nvel_3_timeout():
	get_node("Timer Nível 2").stop()
	get_node("Timer Nível 2/Rocha level2").stop()
	get_node("lblLevel").set_text("LEVEL 3")
	get_node("Timer Nível 3/Rocha level 3").start()
	

#func to increase the number of rocks when level 3 begins
func _on_Rocha_level_3_timeout():
	var nova_rocha = rocha.instance(true)
	get_node("Rochas Geradas").add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(1100, rand_range(5, 550)))
	
	
#func to remove all the rocks that pass through the scene and remove then from the main scene
func _on_Remove_Meteoros_area_enter( area ):
	area.get_parent().queue_free()
	get_node("Castle Life").set_value(get_node("Castle Life").get_value() - 5)
	
	#check if the castle life is 0 and ends the game if it is true
	if get_node("Castle Life").get_value() == 0:
		get_tree().set_pause(true)
		get_node("PanelGameOver").show()
		get_node("Rochas Geradas").hide()



#func to crete enemy shoots when he enters the scene and using the enemy position
func _on_Enemy_Shoot_timeout():
	var novo_shoot = enemyshot.instance(true)
	novo_shoot.set_scale(Vector2(0.2, 0.2))
	var enemypos = get_node("Enemy/Path2D/PathFollow2D/Enemy2D/CollisionShape2D").get_global_pos()
	novo_shoot.set_pos(Vector2(enemypos.x - 100, enemypos.y - 40))
	add_child(novo_shoot)


#func to reload the game when the button is pressed
func _on_btTryAgain_pressed():
	get_tree().reload_current_scene()
	get_node("PanelGameOver").hide()
	get_tree().set_pause(false)


#func to put the enemy on the scene when the final level starts
func _on_Timer_Enemy_timeout():
	var enemyRed = enemy.instance(true)
	enemyRed.set_scale(Vector2(0.45, 0.45))
	enemyRed.set_pos(Vector2(660, 400))
	get_node("Enemy Shoot").start()        #starts enemy shoot
	add_child(enemyRed)
	get_node("Timer Nível 3").stop()
	get_node("Timer Nível 3/Rocha level 3").stop()
	get_node("Enemy Vida").show()
	get_node("lblLevel").set_text("Final Level")


#func to go back to the initial scene when the button is pressed
func _on_btExit_pressed():
	get_tree().change_scene("res://Scenes/Painel Inicial.tscn")


#func to restart the game when the player wins
func _on_btTryAgainWin_pressed():
	get_tree().reload_current_scene()
	get_node("PanelGameOver").hide()
	get_tree().set_pause(false)
