extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.killedBy:
		get_node(Global.killedBy).remove_and_skip()
	if Global.position:
		$Player.position = Global.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
