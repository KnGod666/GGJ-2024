extends RigidBody2D

@onready var raycast = $RayCast2D
@onready var base = $"/root/Base"
var move_direction = Vector2(0,0)
var speed = 500
var stopped = false
var muertes = 0
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
		if e.velocity > Vector2(0,0):
			$Sprite2D.frame_coords = Vector2(1,0)
		if e.velocity == Vector2(0,0):
			$Sprite2D.frame_coords = Vector2(0,0)

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
	muertes+=1
	$Sprite2D.frame_coords = Vector2(0,1)
	self.process_mode = Node.PROCESS_MODE_DISABLED
	if muertes == 1: 
		base.show_dialog(
			["Te has encajado una espina de un aspecto sospechoso.", "No mueres ni nada, pero enfermas de una enfermedad grave y desconocida...", "Adivina cuál es la diferencia entre tú y una iglesia abandonada.", "Resulta que ninguno de los dos tiene cura."]
		)
	elif muertes == 2:
		base.show_dialog(
			["Luego de esto tu vida pasa a segundo plano.", "Porque te moriste.", "Pero miremos el lado bueno...", "Por fin conocerás a tu abuelo Vicente :)"]
		)
	elif muertes == 3:
		base.show_dialog(
			["Crees que morir es divertido?", "Ya basta, eso duele.", "Lo normal es morir una sola vez, pero parece abusar de tu privilegio se ha vuelto costumbre."]
		)
	elif muertes >= 4:
		base.show_dialog(
			["AHHHHHH &*%^(^(*&^(T$%^#%&)))"]
		)	
	await $"/root/Base/Camera2D/DialogBar".ended
	coor()
	self.process_mode = Node.PROCESS_MODE_INHERIT
	$Sprite2D.frame_coords = Vector2(0,0)


func coor():
	if $"//root/Base/maps".get_child(0).name == "HollowLvl":
		self.position = GlobalConstants.Pos_Hollow
	if $"//root/Base/maps".get_child(0).name == "Begin":
		self.position = GlobalConstants.Pos_Begin
	if $"//root/Base/maps".get_child(0).name == "MapPadre":
		self.position = GlobalConstants.Pos_Kn
