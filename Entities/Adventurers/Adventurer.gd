extends Entity

class_name Adventurer

enum Classes {WARRIOR, MAGE, CLERIC, ROGUE, RANGER}

@export var MaxMana: int
@export var CurrentMana: int
@export var Level: int = 1
@export var Experience: float = 0
@export var ExpThreshold: float = Level * 1.4
@export var Class: int 


func levelup():
	Level += 1
	ExpThreshold = Level * 1.4
	
func checkExp():
	if Experience >= ExpThreshold:
		levelup()
