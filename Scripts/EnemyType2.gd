extends "res://Scripts/Enemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = speed*7


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func loseLife():
	var enemyType1 = load("res://Scenes/Enemy.tscn")
	var instance = enemyType1.instance()
	instance.set_position(position)
	instance.cooldown = 0.5
	get_parent().add_child(instance)
	queue_free()
