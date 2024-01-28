extends Node
var map = {
	"NPC Bad": 
		["Voteya123!!", "Digo... No se muy bien como hablar..."],
	"Lol": 
		["Todos son muy complicados, pero con un escaneo adecuado podemos llegar a ver con nuestros ojos todo lo que otros piensan.",
			"Te encuentras en las entrañas del capitalismo y tu misión es reunir dinero.",
			"No puedes volver mientras tu mision no se encuentre completada.",
			"Hay monstruos que te impiden conseguir tu objetivo.",
			"Saben que tu sueldo no te alcanzaría ni para conseguir matrimonio...",
			"... y deberías agradecer...",
			"Pero tu objetivo es salir de las entrañas, así que deberás conseguir salario a costa de aquello que los monstruos no quieren."],
}
@onready var wall = $"./Sprite2D"
# Called when the node enters the scene tree for the first time.
func _ready():
	for level in GlobalConstants.solved_levels:
		if not level:
			return
	
	wall.queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if $"../NPCs/NPC Bad/E".visible and event.is_action_pressed("accione"):
		$"/root/Base/".show_dialog(map["NPC Bad"])
	if $"../NPCs/Lol/E".visible and event.is_action_pressed("accione"):
		$"/root/Base/".show_dialog(map["Lol"])



func _on_soul_room_entrance_body_entered(body):
	if body.name == "Player":
		get_parent().switchScene(1,0)
	pass # Replace with function body.


func _on_soul_room_entrance_2_body_entered(body):
	if body.name == "Player":
		get_parent().switchScene(2,0)
	pass # Replace with function body.


func _on_jh_room_entrance_body_entered(body):
	if body.name == "Player":
		get_parent().switchScene(3,0)
	pass # Replace with function body.


func _on_endgame_area_body_entered(body):
	if body.name == "Player":
		get_tree().quit()
	pass # Replace with function body.
