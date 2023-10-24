extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog = Global.finalDialog.duplicate()
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.enableCursor()
	$AnimationPlayer.play("Intro")
	$AudioStreamPlayer.play()
	$DialogBox.playIntro()
	var final = Global.getFinal()
	if final == "final1":
		dialog.append_array(Global.final1)
	elif final == "final2":
		dialog.append_array(Global.final2)
	elif final == "final3":
		dialog.append_array(Global.final3)
	elif final == "final4":
		dialog.append_array(Global.final4)
	elif final == "final5":
		dialog.append_array(Global.final5)
	elif final == "final6":
		dialog.append_array(Global.final6)
	elif final == "final7":
		dialog.append_array(Global.final7)
	elif final == "final8":
		dialog.append_array(Global.final8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$DialogBox.setTextAndIcon(dialog[pos].text, dialog[pos].talker)
		set_expressions(pos)
		pos+=1

func _on_DialogBox_next():
	if pos < dialog.size():
		$DialogBox.setTextAndIcon(dialog[pos].text, dialog[pos].talker)
		set_expressions(pos)
		pos+=1
	else:
		Global.setGoodEndingColor()
		Global.final()
		get_tree().change_scene("res://Scenes/EndingScene.tscn")

func set_expressions(pos):
	$CharacterHappy.visible = false
	$CharacterSad.visible = false
	$CharacterWorried.visible = false
	$CharacterNeutral.visible = false
	$WifeHappy.visible = false
	$WifeNeutral.visible = false
	$WifeSad.visible = false
	$WifeAngry.visible = false
	$WifeCry.visible = false
	get_node(dialog[pos].wife).visible = true
	get_node(dialog[pos].character).visible = true
