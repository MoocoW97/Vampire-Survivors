extends CharacterBody2D

var screen_size : Vector2
var speed : int
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	speed = 200


func get_input():
	#keyboard input
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir.normalized() * speed

func _physics_process(_delta):
	#player movement
	get_input()
	move_and_slide()
	
#limit movement to window size
	position = position.clamp(Vector2.ZERO, screen_size)
	
	#player rotation
	var mouse = get_local_mouse_position()
	var angle = snappedf(mouse.angle(), PI / 4) / (PI / 4)
	angle = wrapi(int(angle), 0, 8)
	
	animated_sprite.animation = "walk" + str(angle)
	
	#player animation
	if velocity.length() != 0:
		animated_sprite.play()
	else:
		animated_sprite.stop()
		animated_sprite.frame = 1
