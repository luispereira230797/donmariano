extends CanvasLayer
signal next()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro")
	$Label.text = Global.text
	$ContinueButton.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$AnimationPlayer.play("SetText")
		$ContinueButton.visible = true


func _on_ContinueButton_pressed():
	emit_signal('next')
