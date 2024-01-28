extends Node2D

signal changeScene
@export var spawns :Array
@onready var base = $".."

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
	if node == "4" and txt.to_lower() == "marti":
		return true
	else:
		return false
	pass

func switchScene(id, spawn):
	emit_signal("changeScene",id,spawn)


func _on_exit_area_body_entered(body):
	if body.name == "Player":
		switchScene(0,2)
	pass # Replace with function body.
