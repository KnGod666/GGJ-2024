extends Node


@export var isMortal:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == "PlayerArea":
		var player = area.get_parent()
		if isMortal:
			player.kill()
