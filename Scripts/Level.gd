extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.disableCursor()
	if Global.lastPosition:
		$Player/Camera2D.smoothing_enabled = false
		var enemyInstance = get_node(Global.lastEnemy)
		if enemyInstance:
			enemyInstance.remove(self)
		$Player.position = Global.lastPosition
		# Smooth camera
		timer = Timer.new()
		timer.wait_time = 0.5
		timer.connect("timeout", self, "enableSmoothCamera")
		add_child(timer)
		timer.start()
	else:
		Global.lastPosition = $Player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
