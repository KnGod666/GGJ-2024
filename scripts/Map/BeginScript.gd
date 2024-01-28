extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


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
