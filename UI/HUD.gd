extends Control


func _process(_delta):
	$Health.text = "Health: " + str(Global.save_data["health"])
