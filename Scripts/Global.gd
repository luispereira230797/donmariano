extends Node

const miniDonMario = "res://assets/sprites/minidonmario.png"
const miniDrogadicto = "res://assets/sprites/minidrogadicto.png"
const miniWife = "res://assets/sprites/miniwife.png"
const MUSIC_ROSE_GARDEN = "res://Sounds/EndingMusics/RoseGarden.mp3"
const MUSIC_NO_DESTINATION = "res://Sounds/EndingMusics/NoDestination.mp3"
const MUSIC_A_LOST_SOUL = "res://Sounds/EndingMusics/ALostSoul.mp3"

var items = ["cash", "ring", "phone"] #"cash", "ring", "phone"
var current_scene = "KilledByDrogadicto"
var previous_scene = null
var text = ""
var itemSelected = false
var lastCheckPoint = null
var gameOverFinalText = ""
var gameOverMessage = ""
var gameOverText = ""
var gameOverFinalColor = "ff0000"
var gameOverMusic = MUSIC_ROSE_GARDEN
var cutsceneFirstText = ""
var cutsceneFirstIcon = ""

const finalDialog = [
	{
		"text": "Hola mi amor, ya llegué.",
		"wife": "WifeNeutral",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "¿Dónde estuviste, Mariano? ¡Estaba muy preocupada!",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "Pasaron muchas cosas en el camino y casi muero por los asaltos.",
		"wife": "WifeNeutral",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "¿Tienes el dinero para la hipoteca? Hoy estuvieron llamando.",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
]

const final1 = [
	{
		"text": "Sí, mi vida. Por suerte pude sobrevivir a los peligros.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¡Qué bueno, mi amor!",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "* suena el teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¿Hola? ¿Sí?",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¿Cómo? ¡Muchas gracias! Sí, empiezo mañana.",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¿Qué fue eso, mi amor?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "Me aceptaron en ese trabajo que paga el triple.",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¿En serio, amor? ¡Qué bueno!",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "Para festejarlo vamos a cenar tu plato favorito y luego en la cama tu postre.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
]

const final2 = [
	{
		"text": "Sí, mi amor, no pudieron robarme el dinero, pero sí otra cosa.",
		"wife": "WifeNeutral",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "¿Preferiste sacrificar tu celular ante nuestro anillo de bodas?",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "Bueno, sí... Eres lo más importante para mí.",
		"wife": "WifeNeutral",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "Aww, vamos a la mesa a cenar amor, hoy hice tu plato favorito.",
		"wife": "WifeHappy",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "Sí, amor, vamos, vivir en Latinoamérica no está tan mal después de todo.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
]

const final3 = [
	{
		"text": "Sí, mi amor, no pudieron robarme el dinero, pero sí otra cosa muy importante.",
		"wife": "WifeNeutral",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "¿Qué? ¡¿Preferiste que te robaran el anillo de bodas ante el celular?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "Eh... no... no es eso...",
		"wife": "WifeCry",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "¡Ya veo lo poco que te importa nuestro matrimonio!",
		"wife": "WifeCry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "* suena el teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¿Hola? ¿Sí? ¿En serio? ¡Muchas gracias por la oportunidad!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¿Qué fue eso, amor?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "¿Te acuerdas del trabajo en el que me pagarían el triple? ¡Me aceptaron!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¿En serio? ¡Qué bueno!",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "Perdón por perder nuestro anillo...",
		"wife": "WifeHappy",
		"character": "CharacterSad",
		"talker": miniDonMario


	},
	{
		"text": "No importa amor, lo bueno es que estás bien.",
		"wife": "WifeHappy",
		"character": "CharacterSad",
		"talker": miniWife
	},
	{
		"text": "Y ahora vamos a la mesa a cenar tu plato favorito.",
		"wife": "WifeHappy",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "¿En serio?",
		"wife": "WifeHappy",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¡Sí! ¡Y abramos el champán que teníamos guardado! Ahora ganas el triple.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
]

const final4 = [
	{
		"text": "Sí, mi amor, es lo único que no pudieron robarme...",
		"wife": "WifeNeutral",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "¡¿Y nuestro anillo de bodas?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "Tuve que entregarlo o sino...",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "¡Ya veo lo poco que te importa nuestro matrimonio!",
		"wife": "WifeCry",
		"character": "CharacterSad",
		"talker": miniWife
	},
	{
		"text": "Al menos tengo el dinero para la hipoteca.",
		"wife": "WifeCry",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "Como digas, tu cena está en la cocina, hoy duermes en el sofá.",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "Pero...",
		"wife": "WifeAngry",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "¡Me voy al cuarto!",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
]
const final5 = [
	{
		"text": "No, mi amor... Me robaron todo...",
		"wife": "WifeNeutral",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "¡¿Qué?! ¡¿Hasta nuestro anillo?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "Sí, estaba muy peligroso el camino.",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "¡Se acabó! ¡No puedo seguir estando con alguien como tú!",
		"wife": "WifeAngry",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "¿Qué dices, amor?",
		"wife": "WifeAngry",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¡Mi madre tenía razón! ¡Eres un inútil!",
		"wife": "WifeCry",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "¡Me voy a la casa de mi mamá, Mario!",
		"wife": "WifeAngry",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "¡Nunca debí casarme y perder el tiempo contigo!",
		"wife": "WifeCry",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "...",
		"wife": "WifeCry",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¡Hasta nunca, Mario!",
		"wife": "WifeCry",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
]
const final6 = [
	{
		"text": "No, mi amor... Tuve que entregarlo cuando me asaltaron.",
		"wife": "WifeNeutral",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "Pero... no entregaste nuestro anillo de bodas.",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "Preferí perder el dinero, y no el símbolo de nuestro amor.",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "Aww, eres un amor Mariano.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "* suena el teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¿Hola? ¿En serio? ¡Muchas gracias por la oportunidad!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¿Qué fue eso, amor?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "Me aceptaron en el trabajo que paga el triple.",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¡Qué bueno, mi amor! Ahora vamos a cenar tu plato favorito.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "¿Pero y la hipoteca?",
		"wife": "WifeHappy",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "Ya veremos cómo lo resolvemos amor, ahora tienes un buen trabajo.",
		"wife": "WifeHappy",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "Tienes razón, amor.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
]
const final7 = [
	{
		"text": "No, mi amor... solo pude salvar mi celular.",
		"wife": "WifeNeutral",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "¡¿Preferiste tu celular ante nuestro anillo de bodas y el dinero?!",
		"wife": "WifeAngry",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "No es eso, amor...",
		"wife": "WifeCry",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "* suena el teléfono *",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "¿Hola? ¿En serio? ¡Muchas gracias!",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "¿Qué fue eso, Mariano?",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniWife
	},
	{
		"text": "Me aceptaron en el trabajo que paga el triple.",
		"wife": "WifeNeutral",
		"character": "CharacterHappy",
		"talker": miniDonMario
	},
	{
		"text": "Ah, sí, qué bueno.",
		"wife": "WifeSad",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "¿Qué pasa, amor? ¿No estás feliz?",
		"wife": "WifeSad",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "Felicidades, Mariano, la cena está en la cocina, voy a dormir.",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "Pero, amor...",
		"wife": "WifeNeutral",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
]
const final8 = [
	{
		"text": "No, mi amor... solo pude salvar nuestro anillo.",
		"wife": "WifeNeutral",
		"character": "CharacterSad",
		"talker": miniDonMario
	},
	{
		"text": "Preferiste sacrificar tu celular y el dinero...",
		"wife": "WifeNeutral",
		"character": "CharacterWorried",
		"talker": miniWife
	},
	{
		"text": "No quería perder el símbolo de nuestro amor.",
		"wife": "WifeHappy",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "Aww, qué tierno, Mariano...",
		"wife": "WifeHappy",
		"character": "CharacterNeutral",
		"talker": miniWife
	},
	{
		"text": "Pero ahora, ¿cómo vamos a pagar la hipoteca?",
		"wife": "WifeHappy",
		"character": "CharacterWorried",
		"talker": miniDonMario
	},
	{
		"text": "No te preocupes amor, ya lo resolveremos, vendiendo el anillo tal vez.",
		"wife": "WifeHappy",
		"character": "CharacterSad",
		"talker": miniWife
	},
	{
		"text": "¿Segura? Es nuestro anillo de bodas...",
		"wife": "WifeNeutral",
		"character": "CharacterNeutral",
		"talker": miniDonMario
	},
	{
		"text": "Sí amor, ahora vamos a cenar y lo pensamos.",
		"wife": "WifeHappy",
		"character": "CharacterHappy",
		"talker": miniWife
	},
]

func reset():
	items = ["cash", "ring", "phone"] #["cash", "ring", "phone"]
	current_scene = "KilledByDrogadicto"
	gameOverFinalColor = "ff0000"
	previous_scene = null
	text = ""
	itemSelected = false
	lastCheckPoint = null
	gameOverFinalText = ""
	gameOverMessage = ""
	gameOverText = ""
	gameOverMusic = MUSIC_ROSE_GARDEN

func die():
	itemSelected = false
	current_scene = "KilledByDrogadicto"
	callCinematic()

func select(item):
	var pos = items.find(item)
	items.remove(pos)
	current_scene = "ItemSelected"
	itemSelected = true

func callCinematic():
	get_tree().change_scene("res://Scenes/Cutscene.tscn")

func back():
	get_tree().change_scene("res://Scenes/Level1.tscn")

func getFinal():
	#Dinero si, Anillo si, Celular si
	#Final perfecto:
	#Llega a casa feliz porque tiene todo, el dinero para la hipoteca de la casa, el anillo de su boda y su celular a salvo recibe una llamada de un nuevo trabajo que le pagará el triple y lo festeja con su esposa e hijos.
	if items.find("cash") != -1 && items.find("ring") != -1 && items.find("phone") != -1:
		return "final1"
	#Dinero si, Anillo si, Celular no
	#Final feliz:
	#Llega feliz porque pagara la hipoteca a tiempo y tiene una linda cena con su esposa e hijos.
	elif items.find("cash") != -1 && items.find("ring") != -1 && items.find("phone") == -1:
		return "final2"
	#Dinero si, Anillo no, Celular si
	#Final safando
	#Llega preocupado porque le robaron el anillo, su esposa le reclama y él dice que le robaron y ella reclama porque no dio su celular y justo recibe llamada del nuevo trabajo y logra safar eso festejando ahora el nuevo trabajo.
	elif items.find("cash") != -1 && items.find("ring") == -1 && items.find("phone") != -1:
		return "final3"
	# Dinero si, Anillo no, Celular no
	#Final solitario
	#Llega preocupado porque le robaron el anillo, su esposa le reclama y él dice que le robaron y ella reclama eso, pero dice que tiene dinero para la hipoteca y que lograran salir de eso, ella acepta enojada porque perdio el anillo y se queda cenando solo.
	elif items.find("cash") != -1 && items.find("ring") == -1 && items.find("phone") == -1:
		return "final4"
	#Dinero no, Anillo no, Celular no.
	#Bad ending:
	#Llega preocupado porque no tiene nada, su esposa lo regaña y le dice inutil y con sus hijos sale de la casa y le dice que nunca debió casarse con él y que se ira, el hombre se deprime y se suicida.
	elif items.find("cash") == -1 && items.find("ring") == -1 && items.find("phone") == -1:
		return "final5"
	#Dinero no, Anillo si,  Celular si
	#Final feliz alternativo 
	#Llega preocupado porque no tiene dinero para pagar la hipoteca pero su esposa le dice que ya lo arreglaran, llaman ofreciendo el nuevo trabajo con pago triple y festejan eso
	elif items.find("cash") == -1 && items.find("ring") != -1 && items.find("phone") != -1:
		return "final6"
	#Dinero no, Anillo no, Celular si
	#Final solitario 2
	#Llega preocupado porque no tiene dinero ni anillo, su esposa reclama porque tiene el cel y no el anillo pero recibe la llamada del nuevo trabajo, su esposa lo felicita fríamente y lo deja solo.
	elif items.find("cash") == -1 && items.find("ring") == -1 && items.find("phone") != -1:
		return "final7"
	#Dinero no, Anillo si, Celular no
	#Final consuelo
	#Llega preocupado porque no tiene dinero ni celular, su esposa lo abraza y dice que saldrán de eso, tal vez vendiendo el anillo aunque es muy importante.
	elif items.find("cash") == -1 && items.find("ring") != -1 && items.find("phone") == -1:
		return "final8"

func dieAssaulted():
	gameOverMessage = "Ya no tenías nada para los delincuentes, entonces te apuñalaron."
	gameOverFinalText = "Final 2/10"
	gameOverText = "FINAL POR ASALTO"
	get_tree().change_scene("res://Scenes/GameOver.tscn")

func dieByFall():
	gameOverMessage = "Caíste desde muy alto y se rompieron todos tus huesos, y como el sistema de salud \n de tu país es un asco, nunca llegaron y moriste allí."
	gameOverFinalText = "Final 1/10"
	gameOverText = "FINAL POR CAÍDA"

func final():
	var final = getFinal()
	if final == "final1":
		gameOverMessage = "Llegaste a casa con todas tus cosas y te llaman aceptándote un trabajo que\npaga mejor, tu esposa se puso de buen humor."
		gameOverFinalText = "Final 3/10"
		gameOverText = "FINAL PERFECTO"
		gameOverMusic = MUSIC_ROSE_GARDEN
	elif final == "final2":
		gameOverMessage = "Llegaste feliz porque podrás pagar la hipoteca a tiempo y tienes\nuna linda cena con tu esposa."
		gameOverFinalText = "Final 4/10"
		gameOverText = "FINAL FELIZ"
		gameOverMusic = MUSIC_ROSE_GARDEN
	elif final == "final3":
		gameOverMessage = "Llegaste sin el anillo de casamiento y tu esposa se enoja, sin embargo recibes\nuna llamada en la que te aceptan en un trabajo que paga mejor, festejan eso."
		gameOverFinalText = "Final 5/10"
		gameOverText = "FINAL SAFANDO"
		gameOverMusic = MUSIC_ROSE_GARDEN
	elif final == "final4":
		gameOverMessage = "Llegaste sin el anillo de casamiento y sin tu celular pero sí con el dinero para\npagar la hipoteca, tu esposa se enoja y te deja cenando solo."
		gameOverFinalText = "Final 6/10"
		gameOverText = "FINAL SOLITARIO"
		gameOverMusic = MUSIC_NO_DESTINATION
	elif final == "final5":
		gameOverMessage = "Llegaste sin nada, tu esposa se decepciona y te abandona\nhaces algo irreversible..."
		gameOverFinalText = "Final 7/10"
		gameOverText = "BAD ENDING"
		gameOverMusic = MUSIC_A_LOST_SOUL
	elif final == "final6":
		gameOverMessage = "Llegas preocupado porque no tienes el dinero para pagar la hipoteca, sin\nembargo recibes una llamada en la que te aceptan un trabajo que paga mejor, festejan eso."
		gameOverFinalText = "Final 8/10"
		gameOverText = "FINAL FELIZ ALTERNATIVO"
		gameOverMusic = MUSIC_ROSE_GARDEN
	elif final == "final7":
		gameOverMessage = "Llegas preocupado porque no tienes el dinero para la hipoteca, tu esposa\nse enoja porque no tienes el anillo, te llaman aceptándote un trabajo que\npaga mejor, tu esposa te felicita fríamente y te deja cenando solo."
		gameOverFinalText = "Final 9/10"
		gameOverText = "FINAL SOLITARIO ALTERNATIVO"
		gameOverMusic = MUSIC_NO_DESTINATION
	elif final == "final8":
		gameOverMessage = "Llegas preocupado porque te robaron todo menos el anillo, tu esposa\nte consuela y cenan preocupados."
		gameOverFinalText = "Final 10/10"
		gameOverText = "FINAL CONSUELO"
		gameOverMusic = MUSIC_ROSE_GARDEN

func retry():
	reset()
	get_tree().change_scene("res://Scenes/Level1.tscn")

func setGoodEndingColor():
	gameOverFinalColor = "00ff16"
