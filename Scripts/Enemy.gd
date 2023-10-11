extends KinematicBody2D

const speed = 50
const gravity = 20
var velocity = Vector2()
var moving_left = true

export var move = true
export var type = 1
export var canKill = true

func _ready():
	if type == 2:
		$Container/Sprite.modulate = Color(1, 0, 0)

func _process(delta):
	move_character()
	turn()
	
func move_character():
	var auxSpeed = speed
	if type == 2:
		auxSpeed = auxSpeed*4
	velocity.y += gravity
	$AnimationPlayer.play("Walk")
	if move:
		if moving_left:
			velocity.x = -auxSpeed
			velocity = move_and_slide(velocity, Vector2.UP)
		else:
			velocity.x = auxSpeed
			velocity = move_and_slide(velocity, Vector2.UP)
	else:
		velocity.x = 0
		velocity = move_and_slide(velocity, Vector2.UP)

func turn():
	if not $Container/RayCastBottom.is_colliding() || $Container/RayCastForward.is_colliding():
		moving_left = !moving_left
		$Container.scale.x = -$Container.scale.x

func loseLife():
	canKill = false
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D.set_deferred("disabled", true)
	$Area2D/CollisionShape2D

func _on_Area2D2_body_entered(body):
	if body.get_name() == "Player":
		body.kill(self)


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player" && canKill:
		body._loseLife(get_name())
