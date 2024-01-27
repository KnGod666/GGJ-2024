extends Node2D
@onready var maps = $maps
@onready var player = $Player
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	play_initial_cutscene()
	changeMap(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_initial_cutscene():
	pass

func changeMap(id, spawn):
	var scene = load(GlobalConstants.maps_ids[0])
	if scene.can_instantiate():
		scene = scene.instantiate()
	player.position = scene.spawns[spawn]
	maps.add_child(scene)
	pass
