extends KinematicBody2D

var speed = 50
const gravity = 20
var velocity = Vector2()
var moving_left = true
var timeAlive = 0
var cooldown = -1

export var move = true
export var type = 1
export var canKill = true
export var nearbyEnemies = [""]

func _ready():
	if type == 2:
		speed = speed*5

func _process(delta):
	timeAlive += delta
	move_character()
	turn()
	
func move_character():
	velocity.y += gravity
	$AnimationPlayer.play("Walk")
	if move:
		if moving_left:
			velocity.x = -speed
			velocity = move_and_slide(velocity, Vector2.UP)
		else:
			velocity.x = speed
			velocity = move_and_slide(velocity, Vector2.UP)
	else:
		velocity.x = 0
		velocity = move_and_slide(velocity, Vector2.UP)

func turn():
	if (not $Container/RayCastBottom.is_colliding() || $Container/RayCastForward.is_colliding()) && move:
		moving_left = !moving_left
		$Container.scale.x = -$Container.scale.x

func loseLife():
	if cooldown != -1 && timeAlive > cooldown || cooldown == -1:
		canKill = false
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		$CollisionShape2D.set_deferred("disabled", true)
		$Area2D/CollisionShape2D

func _on_Area2D2_body_entered(body):
	if body.get_name() == "Player":
		body.kill(self)


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player" && canKill:
		body._loseLife(get_name(), position)

func remove(reference):
	for enemy in nearbyEnemies:
		var enemyFind = reference.get_node(enemy)
		if enemyFind:
			enemyFind.queue_free()
	queue_free()
