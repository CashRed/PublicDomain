extends Node2D

func present_argument(argument_type: String, base_clout: int):
	var final_score = base_clout
	var room_modifiers = []
	
	# Replace 'current_jury' with your actual GridContainer's children
	var current_jury = $JurorGrid.get_children()
	
	# 1. Gather all active modifiers in the room
	for juror in current_jury:
		# If your juror scene has a 'modifiers' array variable:
		room_modifiers.append_array(juror.modifiers)
	
	# 2. Calculate synergies
	if room_modifiers.has("Holy") and room_modifiers.has("Cartoon"):
		final_score *= 2
		
	# 3. Apply to jurors
	for juror in current_jury:
		juror.take_clout_damage(final_score)
