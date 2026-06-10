extends Node

# 1. Declare the variable at the top of the script
var current_jury: Array = []

@onready var juror_grid = $JurorGrid
const JUROR_SCENE = preload("res://scenes/juror.tscn")

func _ready() -> void:
	spawn_8_jurors()

func spawn_8_jurors() -> void:
	for i in range(8):
		var new_juror = JUROR_SCENE.instantiate()
		juror_grid.add_child(new_juror)
		
		# 2. Populate the array so 'current_jury' is no longer empty!
		current_jury.append(new_juror)
