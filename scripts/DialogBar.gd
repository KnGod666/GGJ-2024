extends PanelContainer

signal ended

const ACTION = "accion"
@onready var dialogTextNode = $DialogBarText
@onready var messages = []
@onready var actualMessage = 0
@onready var textPosition = 0
@onready var delay = 0
const time_to_reset = 5
@onready var hasNext = false
@onready var Texts = {}

func _ready():
	hide()

func _process(_delta):
	if delay == time_to_reset:
		delay = 0
		if hasNext and textPosition < len(messages[actualMessage]) and actualMessage < len(messages):
			dialogTextNode.text += messages[actualMessage][textPosition]
			textPosition += 1
	delay += 1

func NextMessage():
	if textPosition < len(messages[actualMessage]):
		dialogTextNode.text = messages[actualMessage]
		textPosition = len(messages[actualMessage])
		return true
	actualMessage += 1
	textPosition = 0
	dialogTextNode.text = ""
	hasNext = actualMessage < len(messages)
	return hasNext

func coolerShowMessages(dialogs):
	show()
	messages = dialogs
	actualMessage = 0
	textPosition = 0
	dialogTextNode.text = ""
	hasNext = true
	pass

func ShowMessages(npcName, npcDialogState):
	show()
	var texts = GetDialogSet(npcName, npcDialogState)
	for msg in texts:
		messages.append(msg)
	actualMessage = 0
	textPosition = 0
	dialogTextNode.text = ""
	hasNext = true

func AddMesages(npcName, state, dialogs):
	Texts[npcName][state] = dialogs

func _input(event):
	if event.is_action_pressed(ACTION):
		if not NextMessage():
			hide()
			ended.emit()

func prueba():
	print("------------------------------------------------------------------------------------")

func GetDialogSet(npcName, npcDialogState):
	return Texts[npcName][npcDialogState]

func JoseDialogs():
	var jose_dialogs = {}
	# Muerte 1
	var jose_muerte1 = ["Te has encajado una espina de un aspecto sospechoso.", "No mueres ni nada, pero enfermas de una enfermedad grave y desconocida...", "Adivina cuál es la diferencia entre tú y una iglesia abandonada.", "Resulta que ninguno de los dos tiene cura."]
	jose_dialogs["muerte1"] = jose_muerte1
	# Muerte 2

	var jose_muerte2 = ["Luego de esto tu vida pasa a segundo plano.", "Porque te moriste.", "Pero miremos el lado bueno...", "Por fin conocerás a tu abuelo Vicente :)"]
	jose_dialogs["muerte2"] = jose_muerte2

	# Muerte 3

	var jose_muerte3 = ["Crees que morir es divertido?", "Ya basta, eso duele.", "Lo normal es morir una sola vez, pero parece abusar de tu privilegio se ha vuelto costumbre."]
	
	jose_dialogs["muerte3"] = jose_muerte3

	# Muerte 4 (A partir de la cuarta muerte siempre se debe mostrar esta)

	var jose_muerte4 = ["AHHHHHH &*%^(^(*&^(T$%^#%&)))"]
	jose_dialogs["muerte4"] = jose_muerte4

	# Dialogo inicial

	var dialogo_inicial = ["\"Mi salario no alcanza.\"", "Jose necesita volver al otro lado, pero su salario no le alcanza...", "Principalmente porque no tiene."]

	jose_dialogs["dialogo_inicial"] = dialogo_inicial

	var dialogo_explicativo1 = ["Vas a necesitar conexión a int"]

	jose_dialogs["dialogo_explicativo1"] = dialogo_explicativo1

	return jose_dialogs
