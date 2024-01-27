extends Node2D
@onready var raycast = $RayCast2D

var move_direction = Vector2(0,0)
var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().warp_mouse(position)
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		var e = event as InputEventMouseMotion
		if e.velocity.length() > 400:
			move_direction = e.velocity.normalized()
	pass

func _physics_process(delta):
	#raycast.target_position = move_direction*speed*delta+Vector2(50,50)*move_direction
	#raycast.force_raycast_update()
	#if raycast.is_colliding():
	#	move_direction = move_direction.bounce(raycast.get_collision_normal())
	#	pass
	position += move_direction*speed*delta
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#cuando "muere" se ejecuta esto, no se q va a hacer de momento probablemente algo random
func kill():
	pass


func _on_player_area_area_entered(area):
	var areas = $PlayerArea.get_overlapping_areas()
	raycast.target_position = move_direction*Vector2(100,100)
	raycast.force_raycast_update()
	if raycast.is_colliding():
		move_direction = move_direction.bounce(raycast.get_collision_normal())
		return
	raycast.target_position = global_position-area.global_position
	raycast.force_raycast_update()
	if(raycast.is_colliding()):
		move_direction = move_direction.bounce(raycast.get_collision_normal())
	raycast.target_position = area.global_position-global_position
	raycast.force_raycast_update()
	if(raycast.is_colliding()):
		move_direction = move_direction.bounce(raycast.get_collision_normal())
	pass # Replace with function body.
