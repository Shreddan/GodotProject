class_name Building extends Node2D

var Adventurer
var random
# Called when the node enters the scene tree for the first time.
func _ready():
	Adventurer = preload("res://Entities/Adventurers/Adventurers.tscn")
	random = RandomNumberGenerator.new()
	random.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ready():
	var inst = Adventurer.instantiate()
	#inst.position = Vector2(get_child(0).position.x, get_child(0).position.y + 60)
	inst.set_self_modulate(Color8(randi() % 255, randi() % 255, randi() % 255))
	add_child(inst)
