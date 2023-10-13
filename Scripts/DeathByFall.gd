extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = Timer.new()
var player = null
signal dieByFall()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DeathByFall_body_entered(body):
	if body.get_name() == "Player":
		body.stopFollowCamera()
		timer.connect("timeout",self,"changeScene")
		timer.wait_time = 2
		timer.one_shot = true
		add_child(timer)
		timer.start()
		player = body
		Global.dieByFall()
		$AudioStreamPlayer.play()
		emit_signal("dieByFall")

func changeScene():
	get_tree().change_scene("res://Scenes/FallEnding.tscn")
	player.followCamera()
