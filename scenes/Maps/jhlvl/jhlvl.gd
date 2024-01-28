extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(_event):
	if Input.is_key_pressed(KEY_S):
		$Player.stopped = not $Player.stopped
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func validate(node:String, txt:String):
	print("llamado", node, txt)
	if node == "4" and txt.to_lower() == "marti":
		print("Respuesta correcta")
	else:
		print("Die")
	pass
