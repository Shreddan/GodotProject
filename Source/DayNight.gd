extends Timer

var time: int = 7
var Day: int = 1

signal EndofDay

func _process(_delta):
	if time > 20:
		set_paused(true)
		EndofDay.emit()


func _on_timeout():
	time += 1
	

func _on_ready():
	pass


