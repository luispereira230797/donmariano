extends Node2D
var timer = Timer.new()
var die = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play(Global.current_scene)

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
		var scene = load("res://Scenes/Items.tscn")
		var itemsSelectorScene = scene.instance()
		add_child(itemsSelectorScene)
	elif die:
		$AnimationPlayer.play("GameOverDrogadicto")
		Global.gameOver()
	else:
		$DialogBox.setText("¡Ah no tenés nada! ¡Entonces me llevo tu vida!")
		die = true
