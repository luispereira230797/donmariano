extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog = [
	"Hola mi amor ya llegué",
	"¿Dónde estuviste Mario? ¡Estaba muy precupada!",
	"Perdí el bus y bueno, casi muero ahi con los asaltos y eso"
]
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro")
	$DialogBox.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$DialogBox.visible = true
		$DialogBox.setText(dialog[pos])
		pos += 1

func _on_DialogBox_next():
	if pos < dialog.size():
		$DialogBox.setText(dialog[pos])
		pos+=1
	else:
		pass
