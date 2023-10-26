class_name DayChange extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func DayTransition():
	$AnimationPlayer.play("DayTransition")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "DayTransition":
		visible = false
