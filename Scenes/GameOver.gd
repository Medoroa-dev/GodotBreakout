extends Node2D
var briqueScene = preload("res://MinScenes/Score.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	var br = briqueScene.instance()
#	br.set_position(Vector2(500,40))
#	get_tree().root.add_child(br)
#
#	br.score = get_node("/root/Ball").points
#
	get_node("Score").score = get_node("/root/Ball").points

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
