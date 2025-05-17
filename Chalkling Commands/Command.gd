class_name Command extends Area2D

var collision_shape = CollisionShape2D.new()

func _init():
	# Prevent direct instantiation
	if get_script() == Command:
		push_error("Command is an abstract class and should not be instantiated directly.")

func run(_on: Chalkling) -> bool:
	if get_script() == Command:
		assert(false, "You must override 'run' in a subclass of Enemy.")
	return false
	
func getDur() -> float:
	if get_script() == Command:
		assert(false, "You must override 'getDur' in a subclass of Enemy.")
	return 0

func _draw():
	pass
