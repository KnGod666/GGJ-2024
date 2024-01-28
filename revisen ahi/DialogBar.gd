extends PanelContainer

var mm = preload("res://scenes/Maps/Level1/Control.gd")
const ACTION = "accion"
var dialogTextNode
var messages = []
var actualMessage = 0
var textPosition = 0
var delay = 0
const time_to_reset = 5
var hasNext = false

func _Ready():
	print("se ejecuta")
	hide()
	dialogTextNode = get_node("DialogBarText")
	hasNext = true

func _Process(_delta):
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

func ShowMessages(npcName, npcDialogState):
	show()
	var dialogs = mm.new()
	var texts = dialogs.GetDialogSet(npcName, npcDialogState)
	for msg in texts:
		messages.append(msg)
	actualMessage = 0
	textPosition = 0
	dialogTextNode.text = ""

func _Input(event):
	if event.is_action_pressed(ACTION):
		if not NextMessage():
			hide()

func prueba():
	print("------------------------------------------------------------------------------------")
