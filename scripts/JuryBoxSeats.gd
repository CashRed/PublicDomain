class_name JuryBoxSeats
extends Resource

var juror: JuryMember = null
var quantity: int = 0

func is_empty() -> bool:
	return juror == null
