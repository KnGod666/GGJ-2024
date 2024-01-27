extends Node

@export var text:String
var globalBody
var showable = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = text
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_line_edit_text_submitted(new_text):
	var correcto = get_parent().get_parent().validate(text, new_text)
	if correcto:
		for child in get_parent().get_children():
			child.text = "Correcto! :D"
			child.showable = false
			#child.hide()
	else:
		globalBody.kill()
	


func _on_interact_body_entered(body):
	if showable:
		globalBody = body
		if body.name == "Player":
			$LineEdit.show()
			$LineEdit.grab_focus()


func _on_interact_body_exited(body):
	if showable:
		globalBody = null
		if body.name == "Player":
			$LineEdit.hide()
