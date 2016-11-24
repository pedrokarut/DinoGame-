extends Node2D

func _ready():
	pass

#func to call the main scene when the button is pressed
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Cenario.tscn")
