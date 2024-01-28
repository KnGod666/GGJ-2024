extends RigidBody2D
@export var isMortal:bool = false
@export var qrCoords:Vector2i
var rand = RandomNumberGenerator.new()
#Para direcc y habilitar mov XxXxXxXxXxXxX
var der = false 
var puede = true
var map = {
	"NPC Bad": [
		"Hola, forastero, le apetece conocer a Maria"
		],
	"NPC Bad2": [
			"Si quieres solución, habla conmigo... "
		],
	"NPC Bad3": [
			"Recorcholis"
		],
	"NPC Bad4": [
			"El jamón está extinto... es una lástima :'("
		],
	"NPC Bad5": [
			"Nague, soy un habanero en la Yuma"
		]
	}
func _ready():
	$QR.frame_coords = qrCoords
	pass


func _process(_delta):
	pass

#Movimiento aleatorio pero no XxXxXxXxXxX
func _on_mov_timeout():
	var rnd = rand.randi_range(0,3)
	if rnd <= 2:
		if der == false and puede == true:
			set_axis_velocity(Vector2(-200, 0))
			der = true
			puede = false
		if der == true and puede == true:
			set_axis_velocity(Vector2(200, 0))
			der = false
			puede = false
		puede = true
		await get_tree().create_timer(1).timeout
		set_axis_velocity(Vector2(1, 0))


func _on_area_2d_area_entered(area):
	if area.name == "PlayerArea":
		var player = area.get_parent()
		if isMortal:
			player.kill()


#Esto es para pulas E y que se reproduzca el dialogo que pongas en >>>> get_node("...").show_dialog("") <<<< XxXxXxXxX
func _input(event):
		if $E.visible and event.is_action_pressed("accione"):
			$"/root/Base/".show_dialog(
				map[name]
			)
		


#Para la interaccion XxXxXxXxXxXxXxXxX
func _on_interact_area_entered(area):
	if area.name == "PlayerArea":
		$E.visible = true
		

func _on_interact_area_exited(area):
	if area.name == "PlayerArea":
		$E.visible = false
		

