extends Node2D
signal changeScene
@export var spawns :Array
@onready var base = $".."
var dark = false
var E_vis = false
var sombra


func _ready():
	$NPCs/UltimaSombra/QR.frame_coords = Vector2(1,0)
	var tween = get_tree().create_tween()
	tween.tween_property($Luces/DirectionalLight2D, "energy", 0, 1.5)


func _input(event):
	if event.is_action_pressed("accion") and E_vis:
		Acciones()


func switchScene(id, spawn):
	emit_signal("changeScene",id,spawn)


func entr(area, E):
	if area.name == "Area2D":
		E.visible = true
		E_vis = true


func sal(area, E):
	if area.name == "Area2D":
		E.visible = false
		E_vis = false


func Cambio():
	if !dark:
		var tween = get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property($Luces/DirectionalLight2D, "energy", 0.7, 1)
		dark = true


func _on_sombra_1_area_entered(area):
	entr(area, $Areas/Sombra1/E1)
	sombra = 1


func _on_sombra_2_area_entered(area):
	entr(area, $Areas/Sombra2/E2)
	sombra = 2


func _on_sombra_3_area_entered(area):
	entr(area, $Areas/Sombra3/E3)
	sombra = 3


func _on_sombra_4_area_entered(area):
	entr(area, $Areas/Sombra4/E4)
	sombra = 4


func _on_sombra_1_area_exited(area):
	sal(area, $Areas/Sombra1/E1)


func _on_sombra_2_area_exited(area):
	sal(area, $Areas/Sombra2/E2)


func _on_sombra_3_area_exited(area):
	sal(area, $Areas/Sombra3/E3)


func _on_sombra_4_area_exited(area):
	sal(area, $Areas/Sombra4/E4)


func _on_camino_1_area_entered(area):
	Cambio()


func _on_camino_2_area_entered(area):
	Cambio()


func _on_camino_3_area_entered(area):
	Cambio()


func Acciones():
	if sombra == -2:
		pass
	if sombra == -1:
		pass
	if sombra == 0:
		pass
	if sombra == 1:
		base.show_dialog()
	if sombra == 2:
		pass
	if sombra == 3:
		pass
	if sombra == 4:
		pass
		
