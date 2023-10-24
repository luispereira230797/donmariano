extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var color = "normal"

# Called when the node enters the scene tree for the first time.
func _ready():
	if color == "red":
		set("custom_styles/normal",load("res://Styles/StyleBaseButtonRed.tres"))
		set("custom_styles/disabled",load("res://Styles/StyleBaseButtonRed.tres"))
		set("custom_styles/focus",load("res://Styles/StyleBaseButtonRedHover.tres"))
		set("custom_styles/pressed",load("res://Styles/StyleBaseButtonRedHover.tres"))
		set("custom_styles/hover",load("res://Styles/StyleBaseButtonRedHover.tres"))
	#text = buttonText
	#$AnimationPlayer.play("Intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
