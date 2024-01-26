extends Node2D
@onready var raycast = $RayCast2D
var speed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().warp_mouse(position)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		var e = event as InputEventMouseMotion
		print(e.velocity)
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
