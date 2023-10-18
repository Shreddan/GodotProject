extends Resource
class_name Entity

@export var Name: String
@export var MaxHealth: int
@export var Health: int
@export var Happiness: int = 100
@export var Gold: int = 0
@export var BaseDefence: int


signal On_HealthLost
signal On_Death

func TakeDamage(Dam):
	Health -= Dam 
	
func GiveDamage(Enemy):
	Enemy.TakeDamage()
