extends Timer

var time: int = 7
var Day: int = 1

var DC

signal EndofDay

func _ready():
	DC = preload("res://Source/day_change.tscn")

func _process(_delta):
	if time > 20:
		set_paused(true)
		EndofDay.emit()


func _on_timeout():
	time += 1
	

func _on_endof_day():
	Day += 1
	var inst = DC.instantiate()
	add_child(inst)
	inst.DayTransition()
	time = 7
	get_tree().create_timer(5)
	set_paused(false)
