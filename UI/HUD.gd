extends Control


func _process(_delta):
	$Health.text = "Health: " + str(Global.save_data["health"])
	$Score.text = "Score:" + str(Global.save_data["score"])
