class_name Combat extends Node

enum Classes {FLEDGELING, WARRIOR, MAGE, CLERIC, ROGUE, RANGER}
var Level: int = 1
var Experience: float = 0
@export var ExpThreshold: float = Level * 1.3
var Class 


	

func _ready():
	Class = Classes.FLEDGELING


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func levelup() -> void:
	Level += 1
	
func checkExp() -> void:
	if Experience >= ExpThreshold:
		levelup()
