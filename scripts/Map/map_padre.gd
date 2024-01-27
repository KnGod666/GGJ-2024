extends Node2D

signal changeScene
@export var spawns :Array
var PosInit


func _ready():
	pass


func _physics_process(delta):
	pass


func _on_soul_room_entrance_body_entered(body):
	print(body.name)
	if body.name == "Player":
		emit_signal("changeScene",1,0)
