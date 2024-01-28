extends Node2D
@onready var maps = $maps
@onready var player = $Player
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	play_initial_cutscene()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_initial_cutscene():
	show_dialog(["\"Mi salario no alcanza.\"", "Jose necesita volver al otro lado, pero su salario no le alcanza...", "Principalmente porque no tiene."])
	await $Camera2D/DialogBar.ended
	changeMap(0,0)
	pass

func changeMap(id, spawn):
	$Camera2D/TextureRect2/AnimationPlayer.play("fade_in")
	await $Camera2D/TextureRect2/AnimationPlayer.animation_finished
	var scene = load(GlobalConstants.maps_ids[id])
	if scene.can_instantiate():
		scene = scene.instantiate()
		maps.get_child(0).queue_free()
		player.position = scene.spawns[spawn]
		maps.call_deferred("add_child", scene)
		scene.changeScene.connect(changeMap)
		$Camera2D/TextureRect2/AnimationPlayer.play("fade_out")
	pass

#gestiona la caja de dialogo
func show_dialog(dialog):
	player.stopped = true
	$Camera2D/DialogBar.coolerShowMessages(dialog)
	await $Camera2D/DialogBar.ended
	player.stopped = false


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		pass
	pass # Replace with function body.
