extends Node2D


# Declare member variables here. Examples:
export var startPosition = Vector2(0, 0)
export var initialPosition = Vector2(0, 0)
export var direction = 1
var initialVelocity = 1000  # Cambia esta velocidad inicial según tus necesidades
var angle = deg2rad(40)  # Cambia el ángulo según tus necesidades
var gravity = 1500  # Ajusta la gravedad según tus necesidades

var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	initialPosition = +startPosition
	$AnimationPlayer.play("Loop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	var x = initialPosition.x + initialVelocity*direction * cos(angle) * time
	var y = initialPosition.y - initialVelocity * sin(angle) * time + (0.5 * gravity * time * time)

	global_position = Vector2(x, y)


func _on_Area2D_body_entered(body):
	if body.get_name().find("Enemy") != -1:
		body.loseLife()
	if body.get_name() != "Player":
		queue_free()
