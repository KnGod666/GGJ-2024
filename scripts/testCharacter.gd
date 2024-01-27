extends RigidBody2D

@onready var raycast = $RayCast2D
var move_direction = Vector2(0,0)
var speed = 500
var stopped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if not stopped:
		move_and_collide(move_direction*speed*delta)
	if move_direction >= Vector2(0,0):
		$Sprite2D.flip_h = false
	if move_direction <= Vector2(0,0):
		$Sprite2D.flip_h = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		var e = event as InputEventMouseMotion
		if e.velocity.length() > 400:
			#move_direction = global_position.direction_to(e.position+get_viewport().get_camera_2d().global_position)
			move_direction = e.velocity.normalized()

func _on_area_2d_body_entered(_body):
	raycast.target_position = move_direction*Vector2(120,120)
	raycast.force_raycast_update()
	if raycast.is_colliding():
		move_direction = move_direction.bounce(raycast.get_collision_normal())
		return
	raycast.target_position = (move_direction*Vector2(120,120)).rotated(PI/2)
	raycast.force_raycast_update()
	if raycast.is_colliding():
		move_direction = move_direction.bounce(raycast.get_collision_normal())
		return
	raycast.target_position = (move_direction*Vector2(120,120)).rotated(PI)
	raycast.force_raycast_update()
	if raycast.is_colliding():
		move_direction = move_direction.bounce(raycast.get_collision_normal())
		return

func kill():
	print("you dead")
	pass
