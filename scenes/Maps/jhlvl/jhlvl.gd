extends Node2D

signal changeScene
@export var spawns :Array
@onready var base = $"/root/Base"

# Called when the node enters the scene tree for the first time.
func _ready():
	base.show_dialog(
		[
			"Vas a necesitar conexión a internet",
			"Podras leer los pensamientos de tus iguales con esta herramienta",
			"Tienes la posibilidad de pausar tu propio movimiento tocando S",
			"Encontrarás la respuesta correcta?"
		]
	)

func _input(event):
	if Input.is_key_pressed(KEY_S):
		base.get_node("Player").stopped = not base.get_node("Player").stopped
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func validate(node:String, txt:String):
	if node == "4" and txt.to_lower() == "marti":
		return true
	else:
		return false

func switchScene(id, spawn):
	emit_signal("changeScene",id,spawn)


func _on_exit_area_body_entered(body):
	if body.name == "Player":
		switchScene(0,2)
	pass # Replace with function body.
