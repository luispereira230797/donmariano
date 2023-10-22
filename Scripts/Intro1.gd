extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog = Global.intro1Dialog
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$AnimationPlayer.play("LoopSleep")
		$DialogBox.visible = true
		$DialogBox.playIntro()


func _on_Dialog_next():
	if pos < dialog.size():
		$DialogBox.setTextAndIcon(dialog[pos].text, dialog[pos].talker)
		set_expressions(pos)
		pos+=1
	else:
		Global.introMusicTime = $AudioStreamPlayer.get_playback_position()
		get_tree().change_scene("res://Scenes/Intro2.tscn")

func set_expressions(pos):
	$ExpSleeping.visible = false
	$ExpSleepingMouth.visible = false
	$ExpWakeUp.visible = false
	var expressions = dialog[pos].character.split(",")
	for expresion in expressions:
		get_node(expresion).visible = true


func _on_DialogBox_finishIntro():
	_on_Dialog_next()
