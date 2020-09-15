extends RigidBody2D
export var SPEEDUP = 11
export var  MAXSPEED = 600
var points = 0
var briqueScene = preload("res://MinScenes/Brick1.tscn")
var moonOpacity = 0
var starOpacity = 0
var alienOpacity = 0
var cometOpacity = 0

func _ready():
		set_physics_process(true)
		
		
		
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("bricks"):
			get_node("BrickSound").play()
			
			get_node("/root/World/Sprite").play("effect",true)
			moonAppear()
			get_node("/root/World/Score").score += 1
			body.queue_free()
			points = get_node("/root/World/Score").score
			if points%5 == 0 :
				create5brick()
		if body.get_name() == "Paddle":
			get_node("PaddleSound").play()
			var speed =linear_velocity.length()
			var direction = position - body.get_node("direction").get_global_position()
			var velocity = direction.normalized()*min(speed+SPEEDUP,MAXSPEED)
			linear_velocity = velocity #applique automatiquement delta
	if position.y > get_viewport_rect().end.y:
		
		queue_free()
#		destroy bricks created from create5brick()
		remove_child(get_node("/root/World/BriqueCreate"))
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		
		
		
#crée 5 briques aleatoire
func create5brick():
	#enumére les 15 positions possibles de la brique
#	randomize array values and read first case then remove this one. Do this 5 times
	var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	for n in range(5):
		randomize()
		array.shuffle()
		print(str(array[0]))
		var brique = briqueScene.instance()
		var pos = get_node("/root/World/BriquePosition/Br"+str(array[0])).get_global_position()
		array.remove(0)
		brique.set_position(Vector2(pos.x,pos.y))
		get_node("/root/World/BriqueCreate").add_child(brique)
		
#moon and other space sprites
func moonAppear():

	moonOpacity+=0.1
	print(str(moonOpacity))
	get_node("/root/World/Moon").modulate = Color(1,1,1,min(1,moonOpacity))
	if moonOpacity >= 1:
		starOpacity += 0.1
		get_node("/root/World/Star").modulate = Color(1,1,1,min(1,starOpacity))
	if starOpacity >=1:
		alienOpacity += 0.1
		get_node("/root/World/Alien").modulate = Color(1,1,1,min(1,alienOpacity))
	if alienOpacity >=1:
		cometOpacity += 0.1
		get_node("/root/World/Comet").modulate = Color(1,1,1,min(1,cometOpacity))
