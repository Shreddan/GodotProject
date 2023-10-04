class_name Adventurer extends CharacterBody2D


@export var speed = 200
var happiness = 100
var Level = 1
var Experience = 0
@export var ExpThreshold = Experience * Level + 1.3
var Exhaustion = 0
var Class = Classes.FLEDGELING
var Gold = 0

enum Classes {FLEDGELING, WARRIOR, MAGE, CLERIC, ROGUE, RANGER}

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var anim := $AnimatedSprite2D as AnimatedSprite2D

var random

signal quest_started
signal quest_completed
signal health_depleted


func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()
	position = to_local(Vector2(10, 10))
	set_self_modulate(Color(Color.BROWN))

func _process(_delta):
	makepath()
	var dir = to_local(nav_agent.get_next_path_position())
	
	
	if dir.x > 0 :
		anim.flip_h = false
		anim.play("WalkRight")
	elif dir.x < 0 :
		anim.flip_h = true
		anim.play("WalkRight")
	else:
		anim.play("IdleDown")
	#elif dir > 0:
	#	anim.play("WalkUp")
	#elif dir < 0:
	#	anim.play("WalkDown")
	
	
func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()


func makepath() -> void:
	if Input.is_action_just_released("RightClick"):
		nav_agent.target_position = get_global_mouse_position()
		
func levelup() -> void:
	Level += 1
	
func checkExp() -> void:
	if Experience >= ExpThreshold:
		levelup()
