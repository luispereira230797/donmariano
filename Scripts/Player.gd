extends KinematicBody2D

const moveSpeed = 5
const maxSpeed = 300

const jumpHeight = -450
const up = Vector2(0, -1)
const gravity = 20
onready var sprite = $Sprite
var timeInAir = 0
var movingRight = false
var movingLeft = false

var motion = Vector2()

func _physics_process(delta):
	if $RayCast2DBottom.is_colliding() || $RayCast2DBottom2.is_colliding():
		timeInAir = 0
	else:
		timeInAir += delta
	motion.y += gravity
	var friction = false
	# If press right go to right
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		$AnimationPlayer.play("Idle")
		motion.x = 0
	elif Input.is_action_pressed("ui_right"):
		movingRight = true
		sprite.flip_h = false
		sprite.offset.x = 0
		$AnimationPlayer.play("Walk")
		if movingLeft:
			motion.x = moveSpeed
			movingLeft = false
		elif(motion.x + moveSpeed > maxSpeed):
			motion.x = maxSpeed
		else:
			motion.x = motion.x + moveSpeed
	# If press left go to left
	elif Input.is_action_pressed("ui_left"):
		movingLeft = true
		sprite.flip_h = true
		sprite.offset.x = 50
		$AnimationPlayer.play("Walk")
		if movingRight:
			motion.x = -moveSpeed
			movingRight = false
		elif(motion.x - moveSpeed < -maxSpeed):
			motion.x = -maxSpeed
		else:
			motion.x = motion.x - moveSpeed
	else:
		$AnimationPlayer.play("Idle")
		friction = true
	# If is pressing jump button and is in the limit of time, jump
	if Input.is_action_pressed("ui_up"):
		if $RayCast2DBottom.is_colliding() || $RayCast2DBottom2.is_colliding():
			motion.y = jumpHeight
		elif timeInAir < 0.25:
			motion.y = jumpHeight
	if friction == true:
		motion.x = 0
	if !is_on_floor():
		$AnimationPlayer.play("Jump")
		if friction == true:
			motion.x = 0
	# If not in floor and is falling, check de jump correction
	if !is_on_floor() && motion.y < 0:
		if $RayCast2DLeft.is_colliding() && !$RayCast2DRight.is_colliding():
			motion.x = 120
		elif !$RayCast2DLeft.is_colliding() && $RayCast2DRight.is_colliding():
			motion.x = -120
	motion = move_and_slide(motion, up)

func _loseLife(name):
	Global.die("¡Esto es un asalto Don! ¡Arriba las manos y dame lo que tengas carajo!")
	# get_tree().reload_current_scene()

func kill(enemy):
	motion.y = jumpHeight
	enemy.loseLife()

func isAbove(enemy):
	return position.y < enemy.position.y
