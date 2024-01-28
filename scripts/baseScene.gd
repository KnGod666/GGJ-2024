extends Node2D
@onready var maps = $maps
@onready var player = $Player
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	play_initial_cutscene()
	changeMap(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_initial_cutscene():
	pass

func changeMap(id, spawn):
	$Camera2D/TextureRect2/AnimationPlayer.play("fade_in")
	var scene = load(GlobalConstants.maps_ids[id])
	if scene.can_instantiate():
		scene = scene.instantiate()
		maps.get_child(0).queue_free()
		player.position = scene.spawns[spawn]
		maps.call_deferred("add_child", scene)
		scene.changeScene.connect(changeMap)
	pass

#gestiona la caja de dialogo
func show_dialog(dialog):
	player.stopped = true
	$Camera2D/DialogBar.coolerShowMessages(dialog)
	await $Camera2D/DialogBar.ended
	player.stopped = false
