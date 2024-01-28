extends Node2D
signal changeScene
@export var spawns :Array
@onready var base = $"//root/Base/"
var dark = false
var E_vis = false
var sombra
var order = ["", "", "", ""]
var txt 
var i = 0


func _ready():
	$NPCs/UltimaSombra/QR.frame_coords = Vector2(1,0)
	var tween = get_tree().create_tween()
	tween.tween_property($Luces/DirectionalLight2D, "energy", 0, 1.5)


func _input(event):
	if event.is_action_pressed("accion") and E_vis:
		Acciones()
		E_vis = false


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


func _on_central_area_entered(area):
	entr(area, $Areas/Central/E1)
	sombra = 5
 

func _on_central_area_exited(area):
		sal(area, $Areas/Sombra1/E1)

func Acciones():
	if sombra == -2:
		pass
	if sombra == -1:
		pass
	if sombra == 0:
		pass
	if sombra == 1:
		if i <= 3:
			txt = ["Odio GoDot..."]
			base.show_dialog(txt)
			order[i] = "1"
			i += 1
			Orden()
	if order == ["4", "3", "2", "1"]:
		$Areas/Central.process_mode = Node.PROCESS_MODE_INHERIT
		i = 0
		base.show_dialog()
	if sombra == 2:
		if i <= 3:
			txt = ["Necesito un sugar.", "YA!!!!!!."]
			base.show_dialog(txt)
			order[i] = "2"
			i += 1
			Orden()
		i = 0
	if sombra == 3:
		if i <= 3:
			txt = ["Jose Marti?", "Enserio?"]
			base.show_dialog(txt)
			order[i] = "3"
			i += 1
			Orden()
		i = 0
	if sombra == 4:
		if i <= 3:
			txt = ["Yo era aesteti deso...", "Mirame ahora."]
			base.show_dialog(txt)
			order[i] = "4"
			i += 1
			Orden()
		i = 0
	if sombra == 5:
		switchScene(0, 0)


func Orden():
	if i == 0:
		$"HUD/Panel/1".text = order[i]
	if i == 1:
		$"HUD/Panel/1".text = order[i]
	if i == 2:
		$"HUD/Panel/1".text = order[i]
	if i == 3:
		$"HUD/Panel/1".text = order[i]
