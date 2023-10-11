extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog = [
	{
		"text": "Hola mi amor ya llegué",
		"wife": "WifeNeutral",
		"character": "CharacterSad"
	},
	{
		"text": "¿Dónde estuviste Mario? ¡Estaba muy precupada!",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "Pasaron muchas cosas en el camino y casi muero ahi con los asaltos y eso",
		"wife": "WifeNeutral",
		"character": "CharacterWorried"
	},
	{
		"text": "¿Tenés el dinero para la hipoteca? Hoy estuvieron llamando",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
]
var final1 = [
	{
		"text": "Si mi vida, por suerte pude sobrevivir a los asaltos",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
	{
		"text": "* suena teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Hola? ¿Sí?",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Cómo? ¡Muchas gracias! Si empiezo mañana",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿Qué fue eso mi amor?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "Me aceptaron en ese trabajo que te dije que pagan el triple",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿En serio amor? Que buenooo",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
	{
		"text": "Para festejarlo vamos a cenar y luego en la cama tendrás tu postre <3",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
]
var final2 = [
	{
		"text": "Si mi amor, no pudieron robarme el dinero pero sí otra cosa",
		"wife": "WifeNeutral",
		"character": "CharacterSad"
	},
	{
		"text": "¿Preferiste sacrificar tu celular que nuestro anillo de casamiento? Aww",
		"wife": "WifeHappy",
		"character": "CharacterNeutral"
	},
	{
		"text": "Bueno sí... Sos lo más importante para mí",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
	{
		"text": "Bueno amor, vamos a la mesa a cenar, hoy hice tu plato favorito",
		"wife": "WifeHappy",
		"character": "CharacterNeutral",
	},
	{
		"text": "Si amor, vamos, vivir en latinoamerica no esta mal después de todo",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
]
var final3 = [
	{
		"text": "Si mi amor, no pudieron robarme el dinero pero sí otra cosa importante",
		"wife": "WifeNeutral",
		"character": "CharacterSad"
	},
	{
		"text": "¿Qué? ¡¿Preferiste que te robaran el anillo que el celular?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "Eh.. no.. no es eso...",
		"wife": "WifeCry",
		"character": "CharacterWorried"
	},
	{
		"text": "¡Ya veo lo poco que te importa nuestro matrimonio!",
		"wife": "WifeCry",
		"character": "CharacterWorried"
	},
	{
		"text": "* suena teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Hola? ¿Sí? ¿En serio? ¡Muchas gracias por la oportunidad!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿Qué fue eso amor?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿Te acordas del trabajo en el que me pagarían el triple? ¡Me aceptaron!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿En serio? ¡Qué bueno!",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
	{
		"text": "Perdón por perder nuestro anillo",
		"wife": "WifeHappy",
		"character": "CharacterSad"
	},
	{
		"text": "No importa amor, lo bueno es que estás bien",
		"wife": "WifeHappy",
		"character": "CharacterSad"
	},
	{
		"text": "Y ahora vamos a la mesa a cenar tu plato favorito",
		"wife": "WifeHappy",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿En serio?",
		"wife": "WifeHappy",
		"character": "CharacterNeutral"
	},
	{
		"text": "¡Sí! ¡Y abramos el champagne que teníamos guardado! Ahora ganas el triple",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
]
var final4 = [
	{
		"text": "Si mi amor, es lo único que no pudieron robarme",
		"wife": "WifeNeutral",
		"character": "CharacterSad"
	},
	{
		"text": "¡¿Y nuestro anillo?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "Debí entregarlo o sino...",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "¡Ya veo lo poco que te importa nuestro matrimonio!",
		"wife": "WifeCry",
		"character": "CharacterSad"
	},
	{
		"text": "Al menos tengo el dinero para la hipoteca",
		"wife": "WifeCry",
		"character": "CharacterWorried"
	},
	{
		"text": "Como digas, tu cena está en la cocina, hoy dormís en el sofá",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "Pero...",
		"wife": "WifeAngry",
		"character": "CharacterSad"
	},
	{
		"text": "¡Me voy al cuarto!",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
]
var final5 = [
	{
		"text": "No mi amor... Me robaron todo...",
		"wife": "WifeNeutral",
		"character": "CharacterSad"
	},
	{
		"text": "¡¿Qué?! ¡¿Hasta nuestro anillo?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "Si, estaba muy peligroso el camino",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "¡Se acabó! ¡No puedo seguir estando con alguien como vos!",
		"wife": "WifeAngry",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Qué decís amor?",
		"wife": "WifeAngry",
		"character": "CharacterNeutral"
	},
	{
		"text": "¡Me voy a la casa de mi mamá Mario! ¡Sos un inútil!",
		"wife": "WifeAngry",
		"character": "CharacterNeutral"
	},
	{
		"text": "¡Nunca debí casarme y perder el tiempo contigo!",
		"wife": "WifeCry",
		"character": "CharacterNeutral"
	},
	{
		"text": "...",
		"wife": "WifeCry",
		"character": "CharacterNeutral"
	},
	{
		"text": "¡Hasta nunca Mario!",
		"wife": "WifeCry",
		"character": "CharacterNeutral"
	},
]
var final6 = [
	{
		"text": "No mi amor... Tuve que entregarlo cuando me asaltaron",
		"wife": "WifeNeutral",
		"character": "CharacterWorried"
	},
	{
		"text": "Pero... no entregaste nuestro anillo",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "Preferí perder el dinero que el símbolo de nuestro amor",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "Aww, sos un amor Mario",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
	{
		"text": "* suena teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Hola? ¿En serio? ¡Muchas gracias por la oportunidad!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿Qué fue eso amor?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "Me aceptaron el trabajo que me pagará el triple",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¡Que bueno mi amor! Ahora vamos a cenar tu plato favorito",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
	{
		"text": "¿Pero y la hipoteca?",
		"wife": "WifeHappy",
		"character": "CharacterWorried"
	},
	{
		"text": "Ya veremos como lo resolvemos amor, ahora tenés un buen trabajo",
		"wife": "WifeHappy",
		"character": "CharacterNeutral"
	},
	{
		"text": "Tenés razón amor",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
]
var final7 = [
	{
		"text": "No mi amor... solo pude salvar mi celular",
		"wife": "WifeNeutral",
		"character": "CharacterWorried"
	},
	{
		"text": "¡¿Preferiste tu celular que nuestro anillo y el dinero?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried"
	},
	{
		"text": "No es eso amor...",
		"wife": "WifeCry",
		"character": "CharacterWorried"
	},
	{
		"text": "* suena teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Hola? ¿En serio? ¡Muchas gracias!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "¿Qué fue eso Mario?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "Me aceptaron el trabajo en el que pagan el triple",
		"wife": "WifeNeutral",
		"character": "CharacterHappy"
	},
	{
		"text": "Ah sí, que bueno",
		"wife": "WifeSad",
		"character": "CharacterNeutral"
	},
	{
		"text": "¿Qué pasa amor? ¿No estás feliz?",
		"wife": "WifeSad",
		"character": "CharacterNeutral"
	},
	{
		"text": "Felicidades Mario, la cena está en la cocina, voy a dormir",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "Pero amor...",
		"wife": "WifeNeutral",
		"character": "CharacterWorried"
	},
]
var final8 = [
	{
		"text": "No mi amor... solo pude salvar nuestro anillo",
		"wife": "WifeNeutral",
		"character": "CharacterSad"
	},
	{
		"text": "Preferiste sacrificar tu celular y el dinero...",
		"wife": "WifeNeutral",
		"character": "CharacterWorried"
	},
	{
		"text": "No quería perder el símbolo de nuestro amor",
		"wife": "WifeHappy",
		"character": "CharacterWorried"
	},
	{
		"text": "Aww que tierno Mario...",
		"wife": "WifeHappy",
		"character": "CharacterNeutral"
	},
	{
		"text": "Pero ahora como vamos a pagar la hipoteca",
		"wife": "WifeHappy",
		"character": "CharacterWorried"
	},
	{
		"text": "No te preocupes amor, ya lo resolveremos, vendiendo el anillo tal vez",
		"wife": "WifeHappy",
		"character": "CharacterSad"
	},
	{
		"text": "¿Segura? Es nuestro anillo de bodas",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral"
	},
	{
		"text": "Si amor, ahora vamos a comer tu plato favorito y lo pensamos",
		"wife": "WifeHappy",
		"character": "CharacterHappy"
	},
]
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro")
	$DialogBox.visible = false
	var final = Global.getFinal()
	if final == "final1":
		dialog.append_array(final1)
	elif final == "final2":
		dialog.append_array(final2)
	elif final == "final3":
		dialog.append_array(final3)
	elif final == "final4":
		dialog.append_array(final4)
	elif final == "final5":
		dialog.append_array(final5)
	elif final == "final6":
		dialog.append_array(final6)
	elif final == "final7":
		dialog.append_array(final7)
	elif final == "final8":
		dialog.append_array(final8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$DialogBox.visible = true
		$DialogBox.setText(dialog[pos].text)
		set_expressions(pos)
		pos+=1

func _on_DialogBox_next():
	if pos < dialog.size():
		$DialogBox.setText(dialog[pos].text)
		set_expressions(pos)
		pos+=1
	else:
		pass

func set_expressions(pos):
	$CharacterHappy.visible = false
	$CharacterSad.visible = false
	$CharacterWorried.visible = false
	$CharacterNeutral.visible = false
	$WifeHappy.visible = false
	$WifeNeutral.visible = false
	$WifeSad.visible = false
	$WifeAngry.visible = false
	$WifeCry.visible = false
	get_node(dialog[pos].wife).visible = true
	get_node(dialog[pos].character).visible = true
