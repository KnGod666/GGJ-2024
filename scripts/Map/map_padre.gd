extends Node2D
var map = {
	"NPC Bad": 
		["Voteya123!!", "Digo... No se muy bien como hablar..."],
	"Lol": 
		["Bah!"],
}
signal changeScene
@export var spawns :Array
@onready var base = $"/root/Base/"


func _ready():
	$"NPCs/NPC Bad/QR".frame_coords = Vector2(1,3)
	$"NPCs/Lol/QR".frame_coords = Vector2(2,2)


func switchScene(id, spawn):
	emit_signal("changeScene",id,spawn)
	
func _input(event):
	if $E.visible and event.is_action_pressed("accione"):
		$"/root/Base/".show_dialog(map[name])
