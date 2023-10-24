class_name House extends Node2D

var Ad
@export var width: int
#@export var house: TileMapPattern

# Called when the node enters the scene tree for the first time.
func _ready():
	Ad = preload("res://Entities/Adventurers/Adventurers.tscn")
	width = $Sprite2D.get_rect().size.x
	var inst = Ad.instantiate()
	add_child(inst)
	$Spawn.position = to_local(Vector2(0, 90))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


#func _on_ready():
	
