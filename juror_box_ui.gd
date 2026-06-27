extends Control

@export var Jury: juror_box
@export var seat_scene: PackedScene

@onready var box: GridContainer = $JurorBoxSeats

func _ready() -> void:
	Jury.new_jury.connect(_refresh)
	_refresh()

func _refresh() -> void:
	for child in box.get_children():
		child.queue_free()
	for seat in Jury.seats:
		var ui_seat: JurorBoxUISeat = seat_scene.instantiate()
		ui_seat.set_slot_data(seat)
		box.add_child(ui_seat)
