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
		4:
			timer_func.call(0.001, "Blox")
			timer_func.call(0.5, "Blox")
			timer_func.call(1.5, "Blox")
			timer_func.call(2, "Blox")
			timer_func.call(2.5, "Blox")
			timer_func.call(3, "Storm")
			timer_func.call(3.5, "Blox")
			timer_func.call(4, "Blox")
			timer_func.call(5, "Cloud")
			timer_func.call(6.5, "Blox")
			timer_func.call(7, "Storm")
			return 11
		5:
			timer_func.call(0.001, "BigBad")
			timer_func.call(1, "Storm")
			timer_func.call(2, "Blox")
			timer_func.call(3, "Storm")
			timer_func.call(4, "Blox")
			timer_func.call(5, "Storm")
			timer_func.call(6, "Blox")
			timer_func.call(7, "Storm")
			timer_func.call(8, "Cloud")
			timer_func.call(9, "Storm")
			timer_func.call(10, "Blox")
			timer_func.call(11, "Storm")
			timer_func.call(12, "Blox")
			timer_func.call(13, "Storm")
			timer_func.call(3.5, "Blox")
			timer_func.call(8.5, "Blox")
			timer_func.call(10.5, "Blox")
			timer_func.call(14, "Blox")
			timer_func.call(14.2, "Blox")
			timer_func.call(14.4, "Blox")
			timer_func.call(14.6, "Blox")
			timer_func.call(14.8, "Blox")
			timer_func.call(15, "Storm")
			return 23
		_:
			return 0
