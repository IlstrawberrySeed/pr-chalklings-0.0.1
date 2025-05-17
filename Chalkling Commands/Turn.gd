class_name Turn
extends Command

var rot : float;
const rotError := .2;

func _init(rotationIn:= .5 * PI):
	rot = rotationIn
	
	var vc = TurnVC.new(rot)
	add_child(vc)

func getDur() -> float:
	return 0

func run(on: Chalkling) -> bool:
	if abs(angle_difference(on.rotation, rot)) <  rotError:
		on.rotate(angle_difference(on.rotation, rot))
		return false;
	else:
		on.rotate(on.rotS * sign(angle_difference(on.rotation, rot)))
		return true;
