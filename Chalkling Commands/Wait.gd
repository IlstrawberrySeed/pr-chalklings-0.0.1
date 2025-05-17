class_name Wait
extends Command

var time : float;
const rotError := .2;

func _init(duration:=0.0):
	time = duration
	
	var vc = TurnVC.new(time)
	add_child(vc)

func getDur() -> float:
	return time

func run(_on: Chalkling) -> bool:
	return false
