class_name Go
extends Command

var time : float;
const rotError := .2;

func _init(duration:=0.0):
	time = duration
	
	var vc = GoVC.new(duration)
	add_child(vc)

func getDur() -> float:
	return time

func run(on: Chalkling) -> bool:
	if time:
		on.position += on.transform.x.normalized() * on.moveS
		return false
	else:
		match on.wayObstructed(on.moveS):
			null:
				on.position += on.transform.x.normalized() * on.moveS
				return true
			_:
				on.attack(on.wayObstructed(on.moveS))
				return false
	
