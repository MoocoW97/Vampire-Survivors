extends CharacterBody2D

@onready var player = get_node("/root/Main/Player")
@onready var animated_sprite = $AnimatedSprite2D

signal hit_player

var entered : bool
var speed : int = 100
var direction : Vector2

func _ready():
	var screen_rect = get_viewport_rect()
	entered = false
	#pick a direction for the entrance
	var dist = screen_rect.get_center() - position
	#check if need to move horizontally or vertically
	if abs(dist.x) > abs(dist.y):
		#move horizontally
		direction.x = dist.x
		direction.y = 0
	else:
		#move vertically
		direction.x = 0
		direction.y = dist.y
		
func _physics_process(_delta):
	animated_sprite.animation = "run"
	if entered:
		direction = (player.position - position)
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
	if velocity.x != 0:
		animated_sprite.flip_h = velocity.x < 0


func _on_entrance_timer_timeout():
	entered = true


func _on_area_2d_body_entered(_body):
	hit_player.emit()
