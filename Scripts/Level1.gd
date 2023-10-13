extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.lastCheckPoint:
		$Player.position = Global.lastCheckPoint
	else:
		Global.lastCheckPoint = $Player.position
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
