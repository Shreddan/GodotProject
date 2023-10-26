extends Node

var Rolls : Array[int]

signal DiceRolled
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func rollDice():
	var Roll1 = randi_range(0, 20)
	var Roll2 = randi_range(0, 20)
	var Roll3 = randi_range(0, 10)
	
	Rolls = [Roll1, Roll2, Roll3]
	DiceRolled.emit()
