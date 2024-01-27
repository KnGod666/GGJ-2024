extends Node2D

signal changeScene
@export var spawns :Array
var PosInit
var num = 0


func entr(area, E):
	if area.name == "Area2D":
		E.visible = true


func sal(area, E):
	if area.name == "Area2D":
		E.visible = false


func _ready():
	$NPCs/UltimaSombra/QR.frame_coords = Vector2(1,0)
	var tween = get_tree().create_tween()
	tween.tween_property($Luces/DirectionalLight2D, "energy", 0, 1.5)


func _physics_process(delta):
	pass


func _on_soul_room_entrance_body_entered(body):
	print(body.name)
	if body.name == "Player":
		emit_signal("changeScene",1,0)
