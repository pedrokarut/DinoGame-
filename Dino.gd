extends Node2D

var anim 
var kine

func _ready():
	set_fixed_process(true)
	anim = get_node("DinoKine/AnimatedSprite/AnimationPlayer")
	kine = get_node("DinoKine")
	anim.play("voar")
	
	
func _fixed_process(delta):
	var movi = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		movi += Vector2(0, -1)
		
	if Input.is_action_pressed("ui_down"):
		movi += Vector2(0, 1)
	
	movi = movi * 200 * delta
	kine.move(movi)

func _voar_novamente():
	anim.play("voar")