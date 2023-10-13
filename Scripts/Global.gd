extends Node

var items = ["ring", "cash"]
var current_scene = "KilledByDrogadicto"
var previous_scene = null
var text = ""
var itemSelected = false
var lastCheckPoint = null
var gameOverFinalText = ""
var gameOverMessage = ""
var gameOverText = ""
var gameOverFinalColor = "ff0000"
var cutsceneFirstText = ""
var cutsceneFirstIcon = ""

const miniDonMario = "res://assets/sprites/minidonmario.png"
const miniDrogadicto = "res://assets/sprites/minidrogadicto.png"
const miniWife = "res://assets/sprites/miniwife.png"

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
	gameOverMessage = "YA NO TENÍAS NADA PARA LOS DELINCUENTES, ENTONCES TE MATARON"
	gameOverFinalText = "Final 2/10"
	gameOverText = "FINAL POR ASALTO"
	get_tree().change_scene("res://Scenes/GameOver.tscn")

func dieByFall():
	gameOverMessage = "CAÍSTE DESDE MUY ALTO Y SE ROMPIERON TODOS TUS HUESOS"
	gameOverFinalText = "Final 1/10"
	gameOverText = "FINAL POR CAÍDA"

func final():
	var final = getFinal()
	if final == "final1":
		gameOverMessage = "Llegaste a casa con todas tus cosas y te llaman aceptandote un trabajo que \n paga mejor, tu esposa se puso de buen humor."
		gameOverFinalText = "Final 3/10"
		gameOverText = "FINAL PERFECTO"
	elif final == "final2":
		gameOverMessage = "Llegaste feliz porque podrás pagar la hipoteca a tiempo y tienes \n una linda cena con tu esposa."
		gameOverFinalText = "Final 4/10"
		gameOverText = "FINAL FELIZ"
	elif final == "final3":
		gameOverMessage = "Llegaste sin el anillo de casamiento y tu esposa se enoja, sin embargo recibes \n una llamada en la que te aceptan en un trabajo que paga mejor, festejan eso."
		gameOverFinalText = "Final 5/10"
		gameOverText = "FINAL SAFANDO"
	elif final == "final4":
		gameOverMessage = "Llegaste sin el anillo de casamiento y sin tu celular pero si con el dinero para \n pagar la hipoteca, tu esposa se enoja y te deja cenando solo."
		gameOverFinalText = "Final 6/10"
		gameOverText = "FINAL SOLITARIO"
	elif final == "final5":
		gameOverMessage = "Llegaste sin nada, tu esposa se decepciona y te abandona \n haces algo irreversible..."
		gameOverFinalText = "Final 7/10"
		gameOverText = "BAD ENDING"
	elif final == "final6":
		gameOverMessage = "Llegas preocupado porque no tienes el dinero para pagar la hipoteca, sin \n embargo recibes una llamada en la que te aceptan un trabajo que paga mejor, festejan eso."
		gameOverFinalText = "Final 8/10"
		gameOverText = "FINAL FELIZ ALTERNATIVO"
	elif final == "final7":
		gameOverMessage = "Llegas preocupado porque no tienes el dinero para la hipoteca, tu esposa \n se enoja porque no tienes el anillo, te llaman aceptándote un trabajo que \n paga mejor, tu esposa te felicita fríamente y te deja cenando solo."
		gameOverFinalText = "Final 9/10"
		gameOverText = "FINAL SOLITARIO ALTERNATIVO"
	elif final == "final8":
		gameOverMessage = "Llegas preocupado porque te robaron todo menos el anillo, tu esposa \n te consuela y cenan preocupados."
		gameOverFinalText = "Final 10/10"
		gameOverText = "FINAL CONSUELO"

func retry():
	reset()
	get_tree().change_scene("res://Scenes/Level1.tscn")

func setGoodEndingColor():
	gameOverFinalColor = "00ff16"
