extends Node2D
var timer = Timer.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro")
	$Player/Camera2D.process_mode = Camera2D.CAMERA2D_PROCESS_IDLE
	if Global.lastPosition:
		$Player/Camera2D.smoothing_enabled = false
		get_node(Global.lastEnemy).remove(self)
		$Player.position = Global.lastPosition
		# Smooth camera
		timer = Timer.new()
		timer.wait_time = 0.5
		timer.connect("timeout", self, "enableSmoothCamera")
		add_child(timer)
		timer.start()
	else:
		Global.lastPosition = $Player.position
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://Scenes/FinalScene.tscn")


func _on_DeathByFall_dieByFall():
	$AudioStreamPlayer.stop()


func _on_DeathByFall2_dieByFall():
	$AudioStreamPlayer.stop()


func _on_DeathByFall3_dieByFall():
	$AudioStreamPlayer.stop()


func _on_DeathByFall4_dieByFall():
	$AudioStreamPlayer.stop()

func enableSmoothCamera():
	$Player/Camera2D.smoothing_enabled = true
	timer.stop()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$Player/Camera2D.process_mode = Camera2D.CAMERA2D_PROCESS_PHYSICS
		$Player.isLocked = false
