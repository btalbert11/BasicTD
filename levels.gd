extends Node


func start_level(level, timer_func:Callable) -> int:
	match level:
		1:
			timer_func.call(1, "Blox")
			timer_func.call(3, "Blox")
			timer_func.call(5, "Blox")
			timer_func.call(6, "Blox")
			timer_func.call(8, "Blox")
			timer_func.call(9, "Blox")
			timer_func.call(10, "Blox")
#			timer_func.call(0.001, "Blox")
#			timer_func.call(0.02, "Blox")
#			timer_func.call(0.03, "Blox")
#			timer_func.call(0.04, "Blox")
#			timer_func.call(0.05, "Blox")
#			timer_func.call(0.6, "Blox")
#			timer_func.call(0.07, "Blox")
#			timer_func.call(0.08, "Blox")
#			timer_func.call(0.09, "Blox")
			return 7
		2:
			timer_func.call(1, "Blox")
			timer_func.call(2, "Blox")
			timer_func.call(4, "Blox")
			timer_func.call(4.5, "Blox")
			timer_func.call(5, "Blox")
			timer_func.call(7, "Cloud")
			timer_func.call(8, "Blox")
			timer_func.call(8.2, "Blox")
			timer_func.call(8.5, "Blox")
			timer_func.call(8.8, "Blox")
			timer_func.call(9, "Blox")
			return 11
		3:
			timer_func.call(0.001, "Blox")
			timer_func.call(1, "Blox")
			timer_func.call(3, "Blox")
			timer_func.call(4, "Blox")
			timer_func.call(4.5, "Blox")
			timer_func.call(5, "Blox")
			timer_func.call(5.5, "Blox")
			timer_func.call(6, "Blox")
			timer_func.call(6.3, "Blox")
			timer_func.call(6.6, "Blox")
			timer_func.call(7, "Blox")
			timer_func.call(2.2, "Cloud")
			timer_func.call(0.001, "Cloud")
			return 13
		_:
			return 0
