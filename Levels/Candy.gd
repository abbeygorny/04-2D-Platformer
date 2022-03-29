extends KinematicBody2D


func _ready():
	pass


func _on_Area2D_area_entered(area):
		Global.save_data["score"] += 10
		queue_free()
