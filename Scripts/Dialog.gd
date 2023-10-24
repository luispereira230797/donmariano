extends CanvasLayer
signal next()
signal finishIntro()
export var isLocked = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$AnimationPlayer.play("Intro")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventKey:
		if event.pressed && event.is_action("ui_accept") && !isLocked:
			emit_signal('next')

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		isLocked = false
		$ContinueButton.visible = true
		emit_signal("finishIntro")

func _on_ContinueButton_pressed():
	emit_signal('next')

func setText(text):
	$Label.text = text
	$AnimationPlayer.play("SetText")

func setTextAndIcon(text, icon):
	setText(text)
	if icon != "":
		$TalkerIcon.texture = load(icon)
		$TalkerAnimation.play("Loop")
	else:
		$TalkerIcon.texture = null

func playIntro():
	setTextAndIcon("", "")
	$AnimationPlayer.play("Intro")

func hide():
	$AnimationPlayer.play("Hide")

func show():
	$AnimationPlayer.play("Visible")
