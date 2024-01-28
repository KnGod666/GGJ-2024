extends Node

@export var text:String
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_interact_area_entered(area):
	$LineEdit.show()
	pass # Replace with function body.


func _on_interact_area_exited(area):
	$LineEdit.hide()
	pass # Replace with function body.


func _on_line_edit_text_submitted(new_text):
	get_parent().validate(text, new_text)
	#print(new_text)
	pass # Replace with function body.
