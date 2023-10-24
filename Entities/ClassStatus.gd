class_name ClassStatus extends Node2D


enum Classes {WARRIOR, MAGE, CLERIC, ROGUE, RANGER}

var random
@export var Level: int = 1
@export var Experience: float = 0
@export var ExpThreshold: float 
@export var Class: int 

signal Levelledup

# Called when the node enters the scene tree for the first time.
func _ready():
	random = RandomNumberGenerator.new()
	ExpThreshold = Level * 1.4
	Class = randi_range(0, 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	checkExp()

func ClassStats():
	pass

func levelup():
	Level += 1
	ExpThreshold = Level * 1.4
	Levelledup.emit()
	
func checkExp():
	if Experience >= ExpThreshold:
		levelup()
