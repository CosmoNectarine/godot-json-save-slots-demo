extends Node

onready var data = $Control/Panel/Data
onready var slotnum = $Control/Panel/SlotNumber
onready var health = $Control/Panel/Health
onready var level = $Control/Panel/Level
onready var playername = $Control/Panel/PlayerNameEdit
onready var playernametext = $Control/Panel/PlayerName

func _ready():
	SaveSlots.load_data() # Load data from default_data

func _process(delta):
	var file_checker = file_checker()
	data.text = JSON.print(SaveSlots.data)
	health.text = "Health:" + " " + str(SaveSlots.data["player"]["health"])
	level.text = "Level:" + " " + str(SaveSlots.data["player"]["level"])
	playernametext.text = str(SaveSlots.data["player"]["name"])

func file_checker(): # Check files if they are exist or not and disable buttons if they are not.
	var file = File.new()
	if file.file_exists(SaveSlots.slot1):
		$Control/Panel/LoadSlot1.disabled = false
	else:
		$Control/Panel/LoadSlot1.disabled = true
	if file.file_exists(SaveSlots.slot2):
		$Control/Panel/LoadSlot2.disabled = false
	else:
		$Control/Panel/LoadSlot2.disabled = true
	if file.file_exists(SaveSlots.slot3):
		$Control/Panel/LoadSlot3.disabled = false
	else:
		$Control/Panel/LoadSlot3.disabled = true

func _on_Increase_Level_pressed():
	SaveSlots.data["player"]["level"] += 1 # Increase +1 Level

func _on_Decrease_Level_pressed():
	SaveSlots.data["player"]["level"] -= 1 # Decrease -1 Level

func _on_Increase_Health_pressed():
	SaveSlots.data["player"]["health"] += 1 # Increase +1 Health

func _on_Decrease_Health_pressed():
	SaveSlots.data["player"]["health"] -= 1 # Deccrease -1 Health

# Slot 1
func _on_SaveSlot1_pressed():
	SaveSlots.data["player"]["name"] = playername.text # Save player's name
	SaveSlots.path = SaveSlots.slot1 # Change default path to slot1 path
	SaveSlots.save_game() # Save game to slot1

func _on_LoadSlot1_pressed():
	SaveSlots.path = SaveSlots.slot1 # Change default path to slot1 path
	SaveSlots.load_game() # Load slot1
	slotnum.text = "Slot Number:" + " " + "1"

func _on_DeleteSlot1_pressed():
	var dir = Directory.new()
	dir.remove(SaveSlots.slot1) # Find and remove(delete) the slot1.json file


# Slot 2
func _on_SaveSlot2_pressed():
	SaveSlots.data["player"]["name"] = playername.text # Save player's name
	SaveSlots.path = SaveSlots.slot2 # Change default path to slot2 path
	SaveSlots.save_game() # Save game to slot2

func _on_LoadSlot2_pressed():
	SaveSlots.path = SaveSlots.slot2 # Change default path to slot2 path
	SaveSlots.load_game() # Load slot2
	slotnum.text = "Slot Number:" + " " + "2"

func _on_DeleteSlot2_pressed():
	var dir = Directory.new()
	dir.remove(SaveSlots.slot2) # Find and remove(delete) the slot2.json file


# Slot 3
func _on_SaveSlot3_pressed():
	SaveSlots.data["player"]["name"] = playername.text # Save player's name
	SaveSlots.path = SaveSlots.slot3 # Change default path to slot3 path
	SaveSlots.save_game() # Save game to slot3

func _on_LoadSlot3_pressed():
	SaveSlots.path = SaveSlots.slot3 # Change default path to slot3 path
	SaveSlots.load_game() # Load slot3
	slotnum.text = "Slot Number:" + " " + "3"

func _on_DeleteSlot3_pressed():
	var dir = Directory.new()
	dir.remove(SaveSlots.slot3) # Find and remove(delete) the slot3.json file
