extends Area2D

func _on_Candy_body_entered(body):
	if body.name == 'Player':
		Global.save_data["score"] += 10
		queue_free()
