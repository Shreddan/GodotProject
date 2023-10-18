class_name Building extends Node2D

var Ad
@export var house: TileMapPattern

# Called when the node enters the scene tree for the first time.
func _ready():
	Ad = preload("res://Entities/Adventurers/Adventurers.tscn")
	var temp = get_parent()
	var ts = temp.get_tileset()
	if ts.get_patterns_count() > 0:
		#house = 
		print_debug("Pattern count : " + str(ts.get_patterns_count()))
	else:
		print_debug("No house mate soz")
		
	print_debug(house)
	#print_debug(z_index)
	temp.set_pattern(1, position, ts.get_pattern(0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


#func _on_ready():
	#var inst = Ad.instantiate()
	#add_child(inst)
