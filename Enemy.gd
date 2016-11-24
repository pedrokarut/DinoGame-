extends Node2D

var anim

#I used the Path Follow to make the Enemy movementation
func _ready():
	anim = get_node("Path2D/PathFollow2D/Enemy2D/AnimatedSprite/AnimationPlayer")
	anim.play("voar")
	set_fixed_process(true)
	
func _fixed_process(delta):
    get_node("Path2D/PathFollow2D").set_offset(get_node("Path2D/PathFollow2D").get_offset() + (250 * delta))
