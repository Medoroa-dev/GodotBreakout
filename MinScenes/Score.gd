extends Label


var score=0  setget set_score

func set_score (value):
	score = value
	set_text("Score : "+ str(score))
	
	
