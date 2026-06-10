extends Node

var brain_pile: Array[String] = [
	"I'm a devout Christian!", "But, I didn't do it.", "I have no money.", "Liar, liar, pants on fire.", "If I did it, may God smite me down!", "I was just following the chicken.", "It was my evil twin!", "Look over there!", "You have no proof."
]

var draw_pile: Array[String] = []
var current_hand: Array[String] = []
var discard_pile: Array[String]= []

func _ready() -> void:
	start_new_trial()

func start_new_trial() -> void:
	draw_pile = brain_pile.duplicate() # copies 10 base arguments into the active draw pile and shuffle
	draw_pile.shuffle()
	discard_pile.clear()
	draw_next_hand()

func draw_next_hand() -> void:
	current_hand.clear()

	# Draw up to 3 cards
	for i in range(3):
		if draw_pile.is_empty():
			# If out of thoughts, reshuffle the discard pile back in
			draw_pile = discard_pile.duplicate()
			draw_pile.shuffle()
			discard_pile.clear()

		if not draw_pile.is_empty():
			current_hand.append(draw_pile.pop_front())

	print("Your 3 argument choices: ", current_hand)

func play_argument(argument_name: String):
	print("Player used: ", argument_name)
	
	# Remove from hand and send to discard
	current_hand.erase(argument_name)
	discard_pile.append(argument_name)
	
	# Tell all 8 jurors to process this argument
	# 'jurors_group' is a node holding your 8 juror instances
	for juror in $JurorGrid.get_children():
		juror.evaluate_argument(argument_name)
		
	# Check if all 8 are won over
	pass #check_victory_condition()
	
	# Draw back up to 3 for the next turn
	draw_next_hand()
