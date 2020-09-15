extends Button
onready var button = get_node("Button")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	toggle_mode = true
	
func _toggled(button_pressed):
#	get_node("/root/World/br").queue_free()
	get_tree().change_scene("res://Scenes/Level1.tscn")
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
