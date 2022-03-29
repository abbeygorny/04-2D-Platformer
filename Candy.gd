extends KinematicBody2D


func _ready():
	pass


func _on_Area2D_area_entered(body):
	if body.name == 'Player':
		Global.save_data["score"] += 10
		queue_free()
	
