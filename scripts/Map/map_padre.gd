extends Node2D

signal changeScene
@export var spawns :Array
@onready var base = $".."

func switchScene(id, spawn):
	emit_signal("changeScene",id,spawn)
