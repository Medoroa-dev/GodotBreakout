extends KinematicBody2D
const ballScene = preload("res://MinScenes/Ball.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ballLaunched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)


func _physics_process(delta):
	
	set_position(Vector2(get_viewport().get_mouse_position().x,position.y))	
	
	
func _input(event):
	if event is InputEventMouseButton && event.is_pressed() && !ballLaunched  :
		ballLaunched =  true
		var scene = ballScene.instance()
		scene.set_position(position-Vector2(0,16))
		get_tree().root.add_child(scene)
		scene.get_node("PaddleSound").play()
		
	
	
