extends KinematicBody2D

export (int) var speed = 150

var velocity = Vector2()
var inventory = []
onready var interactCheck = $InteractRotate

func _ready():
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		interactCheck.rotation_degrees = 0
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		interactCheck.rotation_degrees = 180
	if Input.is_action_pressed("down"):
		velocity.y += 1
		interactCheck.rotation_degrees = 90
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		interactCheck.rotation_degrees = 270
	
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if get_node("InteractRotate/RayCast2D").is_colliding():
		var collider = get_node("InteractRotate/RayCast2D").get_collider()
		if collider.is_in_group("Interactable") && Input.is_action_just_pressed("space"):
			collider.interact()
