extends Node2D

signal changeScene
@export var spawns :Array
@onready var base = $"/root/Base/"


func _ready():
	pass


func switchScene(id, spawn):
	emit_signal("changeScene",id,spawn)
	
