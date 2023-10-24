extends Node2D
var timer = Timer.new()
var die = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.enableCursor()
	reset()
	$Items.visible = false
	$AudioStreamPlayer.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "KilledByDrogadicto" || anim_name == "ItemSelected":
		pass

func _button_pressed(button):
	Global.select(button.text)
	Global.back()

func _on_DialogBox_next():
	if Global.itemSelected:
		Global.back()
	elif Global.items.size() > 0:
		$DialogBox.hide()
		$Items.visible = true
		$Items.playIntro()
	elif die:
		$AnimationPlayer.play("GameOverDrogadicto")
		Global.dieAssaulted()
	else:
		$DialogBox.setTextAndIcon("¡Ah no tienes nada! ¡Entonces me llevo tu vida!", Global.miniDrogadicto)
		die = true

func reset():
	$AnimationPlayer.play(Global.current_scene)
	$DialogBox.playIntro()

func _on_ItemsCanvasLayer_itemSelected():
	$Items.visible = false
	reset()


func _on_DialogBox_finishIntro():
	$DialogBox.setTextAndIcon(Global.cutsceneFirstText, Global.cutsceneFirstIcon)
