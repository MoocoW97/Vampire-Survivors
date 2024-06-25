extends Area2D

var item_type : int # 0: coffee, 1: health, 2: gun

var coffee_box = preload("res://assets/coffee_box.png")
var health_box = preload("res://assets/health_box.png")
var gun_box = preload("res://assets/gun_box.png")
var textures = [coffee_box, health_box, gun_box]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = textures[item_type]

func _on_body_entered(body):
	#coffee
	if item_type == 0:
		print("Coffee")
	#health
	elif item_type == 1:
		print("Lives")
	#gun
	elif item_type == 2:
		print("Gun")
	#delete item box
	queue_free()
