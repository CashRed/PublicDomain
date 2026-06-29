class_name JurorBoxUISeat
extends PanelContainer

@onready var texture: TextureRect = $VBoxContainer/Avatar
@onready var character_name: Label = $VBoxContainer/JurorName

# This is the function called by your main UI script
func set_seat_data(seat_data) -> void:
	# Check if this seat actually has a juror assigned
	if seat_data.juror == null:
		# It's an empty seat
		character_name.text = "Empty"
		texture.texture = null # Or load a placeholder silhouette image
	else:
		# There is a juror here! Pull the data from the JuryMember resource
		var juror: JuryMember = seat_data.juror
		
		character_name.text = juror.juror_name # Adjust to match your resource variable
		texture.texture = juror.texture # Adjust to match your resource variable
