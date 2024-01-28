extends Node

@export var text:String
var globalBody
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = text
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_line_edit_text_submitted(new_text):
	var correcto = get_parent().validate(text, new_text)
	if correcto:
		print("Nice")
	else:
		globalBody.kill()
	


func _on_interact_body_entered(body):
	globalBody = body
	if body.name == "Player":
		$LineEdit.show()
		$LineEdit.grab_focus()


func _on_interact_body_exited(body):
	globalBody = null
	if body.name == "Player":
		$LineEdit.hide()
