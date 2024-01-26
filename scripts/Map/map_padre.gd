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


func _on_sombra_1_area_entered(area):
	entr(area, $Areas/Sombra1/E1)


func _on_sombra_2_area_entered(area):
	entr(area, $Areas/Sombra2/E2)


func _on_sombra_3_area_entered(area):
	entr(area, $Areas/Sombra3/E3)


func _on_sombra_4_area_entered(area):
	entr(area, $Areas/Sombra4/E4)


func _on_sombra_1_area_exited(area):
	sal(area, $Areas/Sombra1/E1)


func _on_sombra_2_area_exited(area):
	sal(area, $Areas/Sombra2/E2)


func _on_sombra_3_area_exited(area):
	sal(area, $Areas/Sombra3/E3)


func _on_sombra_4_area_exited(area):
	sal(area, $Areas/Sombra4/E4)
