extends Timer

var time: int = 7
var Day: int = 1
var Cam: Camera2D

signal EndofDay

func _ready():
	pass
	
	
func _process(_delta):
	if time > 20:
		set_paused(true)
		EndofDay.emit()
		
	if Cam:
		$DayChange.position = Cam.get_screen_center_position()


func _on_timeout():
	time += 1
	

func _on_endof_day():
	Day += 1
	$DayChange.visible = true
	$DayChange.DayTransition()
	time = 7
	get_tree().create_timer(5)
	set_paused(false)
