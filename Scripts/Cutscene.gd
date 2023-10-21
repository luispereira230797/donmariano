extends Node2D
var timer = Timer.new()
var die = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	reset()
	$AudioStreamPlayer.play()
	$Items.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	pass

func _button_pressed(button):
	Global.select(button.text)
	Global.back()

func _on_DialogBox_next():
	if Global.itemSelected:
		Global.back()
	elif Global.items.size() > 0:
		$DialogBox.visible = false
		$Items.visible = true
		$Items.playIntro()
	elif die:
		$AnimationPlayer.play("GameOverDrogadicto")
		Global.dieAssaulted()
	else:
		$DialogBox.setTextAndIcon("¡Ah no tienes nada! ¡Entonces me llevo tu vida!", Global.miniDrogadicto)
		die = true

func itemSelected():
	reset()

func reset():
	$DialogBox.visible = true
	$AnimationPlayer.play(Global.current_scene)
	$DialogBox.setTextAndIcon(Global.cutsceneFirstText, Global.cutsceneFirstIcon)


func _on_ItemsCanvasLayer_itemSelected():
	$Items.visible = false
	reset()
