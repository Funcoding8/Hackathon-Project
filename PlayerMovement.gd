extends KinematicBody2D

onready var sprite: Sprite = get_node("MainCharacter")

var velocity: Vector2 = Vector2()
var speed: int = 50
var noise: int = 5


func turn(direction):
	if (direction == 'left'):
		sprite.region_rect = Rect2(32,0,32,32)
	if (direction == 'right'):
		sprite.region_rect = Rect2(64,0,32,32)
	if (direction == 'up'):
		sprite.region_rect = Rect2(0,0,32,32)
	if (direction == 'down'):
		sprite.region_rect = Rect2(96,0,32,32)



func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		turn('right')
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		turn('left')
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
		turn('up')
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
		turn('down')
	if Input.is_action_just_pressed("sprint"):
		speed = 90
		noise = 8
	if Input.is_action_just_pressed("crouch"):
		speed = 25
		noise = 2
	if Input.is_action_just_released("sprint"):
		speed = 50
		noise = 5
	if Input.is_action_just_released("crouch"):
		speed = 50
		noise = 5
	velocity = move_and_slide(velocity, Vector2.UP)
