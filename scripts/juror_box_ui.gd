extends Control

@export var Jury: juror_box
@export var seat_scene: PackedScene
@export_dir var jurors_folder_path: String = "res://Jurors/"

@onready var box: GridContainer = $JurorBoxSeats

func _ready() -> void:
	Jury.new_jury.connect(_refresh)
	load_jurors_from_folder(jurors_folder_path)
	_refresh()

func _refresh() -> void:
	for child in box.get_children():
		child.queue_free()
	for seat in Jury.seats:
		var ui_seat: JurorBoxUISeat = seat_scene.instantiate()
		ui_seat.set_seat_data(seat)
		box.add_child(ui_seat)

func load_jurors_from_folder(path:String) -> void:
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			# Ensure we are looking at a file, not a subfolder
			if not dir.current_is_dir():
				# Godot 4 exports change .tres extensions to .remap or .md5 in built projects.
				# To make this export-safe, we grab the base name.
				if file_name.ends_with(".tres") or file_name.ends_with(".remap"):
					# Strip the .remap suffix if it exists
					var clean_file_name = file_name.replace(".remap", "")
					var full_path = path + "/" + clean_file_name
					
					# Load the resource safely
					var resource = ResourceLoader.load(full_path) # or just load(full_path)
					var juror_res = load(full_path)
					
					if juror_res is JuryMember:
						Jury.add_juror(juror_res)
						
						file_name = dir.get_next()
						dir.list_dir_end()
	else:
		print("An error occurred when trying to access path: ", path)
	
