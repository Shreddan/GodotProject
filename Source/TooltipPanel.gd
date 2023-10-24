extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_parent().position
	print(get_parent())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
