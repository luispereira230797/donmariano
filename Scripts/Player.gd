extends KinematicBody2D

const moveSpeed = 30
const maxSpeed = 330

const jumpHeight = -500
const up = Vector2(0, -1)
const gravity = 30
onready var sprite = $Sprite
var timeInAir = 0
var movingRight = false
var movingLeft = false
var jumping = false
export var isLocked = false
export var animation = "Idle"

var motion = Vector2()

func _physics_process(delta):
	if !isLocked:
		if $RayCast2DBottom.is_colliding() || $RayCast2DBottom2.is_colliding():
			timeInAir = 0
		else:
			timeInAir += delta
		motion.y += gravity
		var friction = false
		# If press right go to right
		if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
			sprite.flip_h = false
			playAnimation("Idle")
			motion.x = 0
		elif Input.is_action_pressed("ui_right"):
			movingRight = true
			sprite.flip_h = false
			sprite.offset.x = 0
			playAnimation("Walk")
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
			playAnimation("Walk")
			if movingRight:
				motion.x = -moveSpeed
				movingRight = false
			elif(motion.x - moveSpeed < -maxSpeed):
				motion.x = -maxSpeed
			else:
				motion.x = motion.x - moveSpeed
		else:
			playAnimation("Idle")
			friction = true
		# If is pressing jump button and is in the limit of time, jump
		if Input.is_action_pressed("ui_accept"):
			# Play jump sound
			if !jumping:
				$JumpSoundPlayer.play()
				jumping = true
			if $RayCast2DBottom.is_colliding() || $RayCast2DBottom2.is_colliding():
				motion.y = jumpHeight
			elif timeInAir < 0.25:
				motion.y = jumpHeight
		if friction == true:
			motion.x = 0
		if !is_on_floor():
			playAnimation("Jump")
			if friction == true:
				motion.x = 0
		# If not in floor and is falling, check de jump correction
		if !is_on_floor() && motion.y < 0:
			if $RayCast2DLeft.is_colliding() && !$RayCast2DRight.is_colliding():
				motion.x = 200
			elif !$RayCast2DLeft.is_colliding() && $RayCast2DRight.is_colliding():
				motion.x = -200
		motion = move_and_slide(motion, up)
	else:
		playAnimation(animation)

func _loseLife(enemyName, position):
	Global.cutsceneFirstText = "¡Esto es un asalto Don! ¡Arriba las manos y dame lo que tengas carajo!"
	Global.cutsceneFirstIcon = Global.miniDrogadicto
	Global.lastPosition = position
	Global.lastEnemy = enemyName
	Global.die()
	# get_tree().reload_current_scene()

func kill(enemy):
	motion.y = jumpHeight
	enemy.loseLife()
	$KillSoundPlayer.play()

func isAbove(enemy):
	return position.y < enemy.position.y

func stopFollowCamera():
	$Camera2D.current = false

func followCamera():
	$Camera2D.current = true

func _on_JumpSoundArea2D_body_entered(body):
	if body.get_name() != "Player":
		jumping = false

func getNearbyEnemies():
	return $EnemiesDetector.get_overlapping_bodies()

func playAnimation(animation):
	$AnimationPlayer.play(animation)
