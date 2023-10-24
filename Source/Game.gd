extends Node2D

const MAX_CHARACTER_LIMIT = 32


var Build
var DC

var housecount
 
var Treasury = 0
var Mater = 0
var house: Array[House]
var ActiveQuests: Array[Quest]

@onready var TresGold := $CanvasLayer/Treasury as Label
@onready var MatAmount := $CanvasLayer/Materials as Label
@onready var DayNightLabel := $CanvasLayer/Time as Label
@onready var DayLab := $CanvasLayer/Day as Label

signal DayEnded

func _ready():
	Build = preload("res://Buildings/House.tscn")
	DC = preload("res://day_change.tscn")
	DayNight.EndofDay.connect(Endday)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	TresGold.text = "Kingdom Gold : " + str(Treasury)
	MatAmount.position = Vector2(TresGold.position.x, TresGold.position.y + 25)
	MatAmount.text = "Materials : " + str(Mater)
	DayNightLabel.position = Vector2(MatAmount.position.x, MatAmount.position.y + 25)
	DayNightLabel.text = "Time : " + str(DayNight.time) + ":00"
	DayLab.position = Vector2(DayNightLabel.position.x, DayNightLabel.position.y + 25)
	DayLab.text = "Day : " + str(DayNight.Day)
	
	

func _input(event):
	if event.is_action_released("Fullscreen"):
		if (DisplayServer.window_get_mode() != 3):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif event.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://Source/TitleScreen.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://DungeonMap/Map.tscn")


func _on_quit_button_pressed():
	get_tree().quit()



func _on_building_button_pressed():
	housecount = house.size()
	var inst = Build.instantiate()
	house.append(inst)
	add_child(house[housecount - 1])
	
	#print_debug(house.size())
	if (housecount > 0):
		inst.position = Vector2(house[housecount - 1].position.x + (inst.width * 2) + 100, house[0].position.y)
	else:
		inst.position = Vector2(46, 765)

func Endday():
	var inst = DC.instantiate()
	DayNight.time = 7
	DayNight.Day += 1
	add_child(inst)
	inst.position = $Camera.position
	inst.DayTransition()
	get_tree().create_timer(3)
	DayEnded.emit()

