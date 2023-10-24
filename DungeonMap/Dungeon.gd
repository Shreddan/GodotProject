class_name Dungeon extends Node2D



@export var Name: String
@export var Quest: Quest
@export var Explored: int

@onready var anim := $AnimatedSprite2D as AnimatedSprite2D

var Tooltip

signal FullyExplored

# Called when the node enters the scene tree for the first time.
func _ready():
	Tooltip = preload("res://Source/TooltipPanel.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	anim.play("HoverRed")
	
	
func _on_mouse_exited():
	anim.play("default")
