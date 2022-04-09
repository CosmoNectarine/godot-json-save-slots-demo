extends Node

var path = ""
var slot1 = "user://slot1.json"
var slot2 = "user://slot2.json"
var slot3 = "user://slot3.json"
# var slot4, slot5 etc...

# The default values
var default_data = {
	"player" : {
		"name" : "",
		"level" : 3,
		"health" : 10
		},
}

var data = { }

func load_data():
	data = default_data

func load_game():
	var file = File.new()
	file.open(path,file.READ)
	var text = file.get_as_text()
	data = parse_json(text)
	file.close()

func save_game():
	var file
	file = File.new()
	file.open(path, File.WRITE)
	file.store_line(to_json(data))
	file.close()
