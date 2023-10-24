class_name Quest extends Node


enum queststeps {NULL, BATTLE, CHEST, BOSS}

@export var Name: String
@export var Difficulty: int
@export var Assigned: AdventurerParty
@export var Is_Active: bool

var Steps : Array[int]


# Called when the node enters the scene tree for the first time.
func _ready():
	Steps.fill(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
