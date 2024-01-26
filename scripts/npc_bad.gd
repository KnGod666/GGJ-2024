extends ParentObst
var rand = RandomNumberGenerator.new()


func _ready():
	pass


func _process(delta):
	pass

func _on_mov_timeout():
	var rnd = rand.randi_range(0,3)
	if rnd <= 1:
		$".".velocity.x = 100 * -1
