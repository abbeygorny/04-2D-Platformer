extends Node

var fade = null
var fade_speed = 0.015

var fade_in = false
var fade_out = ""

var death_zone = 1000

const SAVE_PATH = "res://savegame.txt"
const SECRET = "C220 Is the Best!"

var save_data = {
	"score":0
	,"health":100
	,"level":"res://Levels/Level1.tscn"
}


func _physics_process(_delta):
	if fade == null:
		fade = get_node_or_null("/root/Game/Camera/Fade")
	if fade_out != "":
		execute_fade_out(fade_out)
	if fade_in:
		execute_fade_in()
		

func start_fade_in():
	if fade != null:
		fade.visible = true
		fade.color.a = 1
		fade_in = true

func start_fade_out(target):
	if fade != null:
		fade.color.a = 0
		fade.visible = true
		fade_out = target

func execute_fade_in():
	if fade != null:
		fade.color.a -= fade_speed
		if fade.color.a <= 0:
			fade_in = false

func execute_fade_out(_target):
	if fade != null:
		fade.color.a += fade_speed
		if fade.color.a >= 1:
			fade_out = ""
			


func restart_level():
	get_tree().paused = false



func save_game():
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.WRITE)
	save_game.store_string(to_json(save_data))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists(SAVE_PATH):
		return
	save_game.open(SAVE_PATH, File.READ)
	var contents = save_game.get_as_text()
	var result_json = JSON.parse(contents)
	if result_json.error == OK:
		save_data = result_json.result
	else:
		print("Error: ", result_json.error)
	save_game.close()
	
	var _scene = get_tree().change_scene(save_data["level"])
	call_deferred("restart_level")
