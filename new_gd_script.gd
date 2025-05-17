extends Node2D

func _ready() -> void:
	var chalkling := Chalkling.new()
	add_child(chalkling)
	chalkling.position = Vector2(40, 100)
	await ready2(chalkling);
	
	while(true):
		await chalkling.execute()


func ready2(chalkling : Chalkling):
	chalkling.position = Vector2(40, 100)
	chalkling.execute()
	
	var rng := RandomNumberGenerator.new()
	rng.randomize()  # Seed it based on current time
	var ypos = 200
	
	for ii in 5 :
		
		await get_tree().process_frame 
		var newCom : Command = Turn.new(TAU*rng.randf())
		chalkling.append(newCom);
		add_child(newCom)
		newCom.position = Vector2(40, ypos)
		ypos+=50
		
		
		await get_tree().process_frame 
		newCom = Go.new(2*rng.randf())
		chalkling.append(newCom);
		add_child(newCom)
		newCom.position = Vector2(40, ypos)
		ypos+=50
		
		await get_tree().process_frame 
		newCom = Wait.new(.3*rng.randf())
		chalkling.append(newCom);
		add_child(newCom)
		newCom.position = Vector2(40, ypos)
		ypos+=50
	
	
	
