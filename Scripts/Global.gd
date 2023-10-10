extends Node

var items = ["ring", "phone", "cash"]
var current_scene = "KilledByDrogadicto"
var previous_scene = null
var killedBy = ""
var position = null
var text = ""
var itemSelected = false

func die(name, pos, textCinematic):
	itemSelected = false
	killedBy = name
	position = pos
	current_scene = "KilledByDrogadicto"
	callCinematic(textCinematic)

func select(item):
	var pos = items.find(item)
	items.remove(pos)
	current_scene = "ItemSelected"
	itemSelected = true

func callCinematic(newText):
	text = newText
	get_tree().change_scene("res://Scenes/Cutscene.tscn")

func back():
	get_tree().change_scene("res://Scenes/Level1.tscn")

func gameOver():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
