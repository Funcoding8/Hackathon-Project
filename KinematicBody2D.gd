extends KinematicBody2D

var speed = 30 
var velocity = Vector2( 0 , 0 )
onready var p = $"../player"

func _physics_process(delta):
	
	animation.play("swish")
	
	velocity = position.direction_to(p.position) * speed
	velocity = move_and_slide(velocity)



	
