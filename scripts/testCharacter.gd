extends RigidBody2D

@onready var raycast = $RayCast2D
var move_direction = Vector2(0,0)
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move_and_collide(move_direction*speed*delta)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		var e = event as InputEventMouseMotion
		if e.velocity.length() > 400:
			move_direction = e.velocity.normalized()


func _on_area_2d_body_entered(body):
	raycast.target_position = move_direction*Vector2(100,100)
	raycast.force_raycast_update()
	if raycast.is_colliding():
		move_direction = move_direction.bounce(raycast.get_collision_normal())
		return
	raycast.target_position = global_position-body.global_position
	raycast.force_raycast_update()
	if(raycast.is_colliding()):
		move_direction = move_direction.bounce(raycast.get_collision_normal())
	raycast.target_position = body.global_position-global_position
	raycast.force_raycast_update()
	if(raycast.is_colliding()):
		move_direction = move_direction.bounce(raycast.get_collision_normal())
	pass # Replace with function body.
