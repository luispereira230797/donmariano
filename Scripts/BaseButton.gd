extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var buttonText = "REINTENTAR"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = buttonText
	#$AnimationPlayer.play("Intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
