extends Node2D

var Adventurer
var Adventurers: Array[Adventurer]
var Building
 
var Treasury = 0

@onready var TresGold := $CanvasLayer/Treasury as Label

const MAX_CHARACTER_LIMIT = 30

func _ready():
	Adventurer = preload("res://Entities/Adventurers/Adventurers.tscn")
	Building = preload("res://Buildings/Building.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	TresGold.text = "Kingdom Gold : " + str(Treasury)


func _input(event):
	if event.is_action_released("Fullscreen"):
		if (DisplayServer.window_get_mode() != 3):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
	if event.is_action_released("ui_select"):
		var inst = Adventurer.instantiate()
		add_child(inst)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Map.tscn")


func _on_quit_button_pressed():
	get_tree().quit()



func _on_building_button_pressed():
	var inst = Building.instantiate()
	inst.position = Vector2(300, 225)
	get_tree().root.add_child(inst)
	
	#place_building(inst)
	
	
	
#func place_building(Building):
	#if 
		#Building.position = get_global_mouse_position()
