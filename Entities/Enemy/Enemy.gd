extends Resource

class_name Enemy

@export var Name: String
@export var Damage: int
@export var Defence: int
@export var MaxHealth: int
@export var Health: int

func TakeDamage(Dam):
	Health -= Dam

func GiveDamage(Adventurer):
	Adventurer.TakeDamage(Damage)
