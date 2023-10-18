extends CharacterBody2D

@export var speed = 200
@export var inventory: Inventory
@export var Adventure: Adventurer
@export var House: Building 

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var anim := $AnimatedSprite2D as AnimatedSprite2D

var random

func _on_ready():
	pass
	#House = get_parent()
	#print_debug(House)
	position = to_local(House.position)
	
	

func _process(_delta):
	Adventure.checkExp()

func _physics_process(_delta: float):
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
	#if nav_agent.distance_to_target() > 5:
	move_and_slide()

func _input(event):
	if event.is_action_released("RightClick"):
		makepath(get_global_mouse_position())

func makepath(target: Vector2):
		nav_agent.target_position = target





