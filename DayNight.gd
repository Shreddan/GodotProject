extends Timer

var time: int = 7


func _process(_delta):
	if time > 20:
		time = 7


func _on_timeout():
	time += 1


func _on_ready():
	pass
