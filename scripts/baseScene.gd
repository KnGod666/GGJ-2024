extends Node2D
@onready var maps = $maps
@onready var player = $Player
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Input.warp_mouse(player.global_position)
	play_initial_cutscene()
	changeMap(1,0)
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

