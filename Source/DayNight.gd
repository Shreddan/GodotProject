extends Timer

var time: int = 7
var Day: int = 1
var Cam: Camera2D

signal EndofDay

func _ready():
	pass
	
	
func _process(_delta):
	if time > 20 && not is_paused():
		set_paused(true)
		EndofDay.emit()
		
	if Cam:
		$DayChange.position = Cam.get_screen_center_position()
		


func _on_timeout():
	time += 1
	

func _on_endof_day():
	Day += 1
	$DayChange.visible = true
	print_debug($DayChange.size)
	$DayChange.DayTransition()
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "DayTransition":
		time = 7
		set_paused(false)
