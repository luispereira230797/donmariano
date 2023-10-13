extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var ending = getEnding()
	get_node(ending).visible = true
	$AnimationPlayer.play(ending)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func getEnding():
	var final = Global.getFinal()
	return "Ending" + final.substr(final.length()-1)


func _on_AnimationPlayer_animation_finished(anim_name):
	var gameOverMessage = load("res://Scenes/GameOverMessage.tscn")
	add_child(gameOverMessage.instance())
