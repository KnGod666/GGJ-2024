extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hub_entrance_body_entered(body):
	if body.name == "Player":
		get_parent().switchScene(0,1)
		pass
	pass # Replace with function body.


func _on_ltp_body_entered(body):
	if body.name == "Player":
		body.position = Vector2(0,0)
	pass # Replace with function body.


func _on_hub_entrance_2_body_entered(body):
	if body.name == "Player":
		GlobalConstants.solved_levels[1]=true
		get_parent().switchScene(0,1)
