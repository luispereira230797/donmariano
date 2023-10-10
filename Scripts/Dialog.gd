extends CanvasLayer
signal next()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro")
	$ContinueButton.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		setText(Global.text)

func _on_ContinueButton_pressed():
	emit_signal('next')

func setText(text):
	$Label.text = text
	$AnimationPlayer.play("SetText")
