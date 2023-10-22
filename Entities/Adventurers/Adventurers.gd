class_name Adventurer extends CharacterBody2D


@export var Name: String
@export var speed = 50
@export var inventory: Inventory
@export var house: House 

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var anim := $AnimatedSprite2D as AnimatedSprite2D

#var random

func _on_ready():
	if get_parent() is House:
		house = get_parent()
		position = to_local(house.position).normalized()
		print_debug(house.get_child(1).position)
		makepath(house.get_child(1).position)
	

func _process(_delta):
	pass

func _physics_process(_delta: float):
	#nav_agent.path_desired_distance = ceil(speed / )
	#nav_agent.target_desired_distance = ceil(speed / )
	if nav_agent.is_navigation_finished():
		return
	
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	if dir.x > 0 :
		anim.flip_h = false
		anim.play("WalkRight")
	elif dir.x < 0 :
		anim.flip_h = true
		anim.play("WalkRight")
	else:
		anim.play("IdleDown")
		
	if dir.y > 0 :
		anim.play("WalkDown")
	elif dir.y < 0 :
		anim.play("WalkUp")
	else:
		anim.play("IdleDown")
	
	move_and_slide()

#func _input(event):
	#if event.is_action_released("RightClick"):
	#	makepath(get_global_mouse_position())

func makepath(target: Vector2):
		nav_agent.target_position = target





