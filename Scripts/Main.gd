extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_scene = ""
const LEVEL1 = "res://Scenes/Level1.tscn"
const CUTSCENE = "res://Scenes/Cutscene.tscn"
var currentScene = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	changeScene(LEVEL1)

func changeScene(scenePath):
	remove_child(get_node("Level1"))
	var scene = load(scenePath)
	var cutscene = scene.instance()
	print(cutscene.name)
	currentScene = cutscene.name
	get_parent().add_child(cutscene)
