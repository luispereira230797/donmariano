extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Loop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BaseButton_pressed():
	get_tree().change_scene("res://Scenes/Intro1.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
