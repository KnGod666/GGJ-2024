extends Node


const maps_ids = {0:"res://scenes/Maps/begin.tscn",1:"res://scenes/Maps/hollow_lvl.tscn",2:"res://scenes/Maps/Kn_map.tscn"
				,3:"res://scenes/Maps/jhlvl/jhlvl.tscn"}
const music_mappings = {0:preload("res://resources/Sound/tema.mp3"),1:preload("res://resources/Sound/relax.mp3"),2:preload("res://resources/Sound/Ian Song.mp3")
					,3:preload("res://resources/Sound/tema.mp3")}
const Pos_Hollow = Vector2(3510, 2171)
const Pos_Kn = Vector2(-570, 0)
const Pos_Begin = Vector2(300, 400)
const Pos_JL = Vector2(0, 0)
var points = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
