extends CanvasLayer
var iconRing = preload("res://assets/Sprites/selectitemring.png")
var iconPhone = preload("res://assets/Sprites/selectitemphone.png")
var iconCash = preload("res://assets/Sprites/selectitemcash.png")
var items = []
var pos = 0
var selected = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal itemSelected()


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScrollContainer.visible = false
	$AnimationPlayer.play("BackgroundAnimation")
	$AcceptButton.visible = false
	var buttons = []
	for item in Global.items:
		var button = Button.new()
		if item == "ring":
			button.icon = iconRing
		elif item == "phone":
			button.icon = iconPhone
		else:
			button.icon = iconCash
		button.flat = true
		button.name = item
		button.connect("pressed", self, "_on_Button_pressed", [button])
		button.connect("focus_entered", self, "_on_Button_focus_entered", [button])
		button.connect("focus_exited", self, "_on_Button_focus_exited", [button])
		button.set("custom_styles/focus",StyleBoxEmpty.new())
		buttons.append(button)
	for button in buttons:
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer.add_child(button)
	items = $ScrollContainer/CenterContainer/MarginContainer/HBoxContainer.get_children()
	pos = 0
	if items.size() > 0:
		_on_Button_focus_entered(items[pos])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected == "":
		$AcceptButton.disabled = true
	else:
		$AcceptButton.disabled = false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "BackgroundAnimation":
		$ScrollContainer.visible = true
		$AcceptButton.visible = true

func _on_Button_pressed(button):
	selected = button.name

func _on_Button_focus_entered(button):
	button.rect_scale.x = 1.1
	button.rect_scale.y = 1.1

func _on_Button_focus_exited(button):
	button.rect_scale.x = 1
	button.rect_scale.y = 1

func _on_AcceptButton_pressed():
	Global.select(selected)
	Global.cutsceneFirstText = "¡Eso me sirve! ¡Nos vemos mañana Don!"
	Global.cutsceneFirstIcon = Global.miniDrogadicto
	emit_signal("itemSelected")
