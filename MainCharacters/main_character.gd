extends CharacterBody2D
@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var is_right = true
@onready var is_left = false
@onready var is_up = false
@onready var is_down = false

var speed = 400  # speed in pixels/sec

func _ready() -> void:
	player_sprite.play("idle_right")


func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed

	move_and_slide()
	
	#animations
	
	if Input.is_action_pressed("left"):
		player_sprite.play("moving_left")
		is_right = false
		is_left = true
		is_up = false
		is_down = false
		
	elif Input.is_action_pressed("down"):
		player_sprite.play("moving_down")
		is_right = false
		is_left = false
		is_up = false
		is_down = true
	elif Input.is_action_pressed("right"):
		player_sprite.play("moving_right")
		is_right = true
		is_left = false
		is_up = false
		is_down = false
		
	elif Input.is_action_pressed("up"):
		player_sprite.play("moving_up")
		is_right = false
		is_left = false
		is_up = true
		is_down = false
	elif is_right and Input.is_action_just_released("right"):
		player_sprite.play("idle_right")
		
	elif is_left and Input.is_action_just_released("left"):
		player_sprite.play("idle_left")
		
	elif is_up and Input.is_action_just_released("up"):
		player_sprite.play("idle_up")
		
	elif is_down and Input.is_action_just_released("down"):
		player_sprite.play("idle_down")
		
	
