extends Node

@export var isMortal:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_obstacle_area_area_entered(area):
	if area.name == "PlayerArea":
		var player = area.get_parent()
		if isMortal:
			player.kill()
		
