extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



const Max_viteza=500
const accel= 3000
const friction= 600000

var input= Vector2.ZERO



func _physics_process(delta):
	player_movment(delta) 
	
	


func get_input():
	
	input.x = int(Input.is_action_pressed("D"))- int(Input.is_action_pressed("A"))
	input.y = int(Input.is_action_pressed("S"))- int(Input.is_action_pressed("W"))
	return input.normalized()
	
func player_movment(delta):
	input = get_input()
	
	if input== Vector2.ZERO:
		if velocity.length() > (friction * delta ):
			velocity -=velocity.normalized() * (friction * delta)
		else:
			velocity=Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(Max_viteza)
	
	move_and_slide()
	
	var isLeft= velocity.x < 0
	animated_sprite_2d.flip_h=isLeft
