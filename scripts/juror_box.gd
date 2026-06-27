class_name juror_box
extends Resource

signal new_jury
@export var seats: Array[JuryBoxSeats] = []
@export var max_seats: int = 8

func _init() -> void:
	for i in range(max_seats):
		seats.append(JuryBoxSeats.new())

func add_juror(new_juror: JuryMember, amount: int = 1) -> int:
	var remaining := amount
	for seat in seats:
		if remaining <= 0:
			break
		if seat.is_empty():
			seat.juror = new_juror
	new_jury.emit()
	return remaining
