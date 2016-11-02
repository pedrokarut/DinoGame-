extends Node2D

var animdino
var disparo = preload("res://Scenes/Disparo.tscn")
var rocha = preload("res://Scenes/Rocha.tscn")
var dino_pos

func _ready():
	animdino = get_node("Dino/KinematicBody2D/AnimatedSprite/AnimationPlayer")
	set_fixed_process(true)
	var dino_pos = get_node("Dino/Position2D")
	
	
func _fixed_process(delta):
	
	if Input.is_action_pressed("shoot"):
		var dino_pos = get_node("Dino/Position2D").get_pos()
		var novo_disp = disparo.instance(true)
		animdino.play("cuspir fogo")
		add_child(novo_disp)
		novo_disp.set_pos(Vector2(dino_pos.x + 200, dino_pos.y + 200))


func _on_Rocha_timeout():
	var dino_pos = get_node("Dino/Position2D").get_pos()
	var nova_rocha = rocha.instance(true)
	add_child(nova_rocha)
	nova_rocha.set_pos(Vector2(900, dino_pos.y + 200))
