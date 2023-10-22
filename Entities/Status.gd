class_name Status extends Node

@export var MaxHealth: int
var Health: int
@export var MaxMana: int
var Mana: int
@export var Happiness: int = 100


func _ready():
	Health = MaxHealth
	Mana = MaxMana
	
	

