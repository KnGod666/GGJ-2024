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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	print($"../maps".get_child(0).name)
	if event is InputEventMouseMotion:
		var e = event as InputEventMouseMotion
		if e.velocity.length() > 400:
			#move_direction = global_position.direction_to(e.position+get_viewport().get_camera_2d().global_position)
			move_direction = e.velocity.normalized()
		if e.velocity > Vector2(0,0):
			$Sprite2D.frame_coords = Vector2(1,0)
		if e.velocity == Vector2(0,0):
			$Sprite2D.frame_coords = Vector2(0,0)

func _on_area_2d_body_entered(body):
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
	$Sprite2D.frame_coords = Vector2(0,1)
	self.process_mode = Node.PROCESS_MODE_DISABLED
	await get_tree().create_timer(1).timeout
	Pos()
	self.process_mode = Node.PROCESS_MODE_INHERIT
	$Sprite2D.frame_coords = Vector2(0,0)


func Pos():
	if $"../maps".get_child(0).name == "HollowLvl":
		self.position = GlobalConstants.Pos_Hollow
	if $"../maps".get_child(0).name == "Begin":
		self.position = GlobalConstants.Pos_Begin
	if$"../maps".get_child(0).name == "MapPadre":
		self.position = GlobalConstants.Pos_Kn
