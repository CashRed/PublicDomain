class_name JuryMember
extends Resource

@export var character_name: String #name
@export var texture: Texture2D #character sprite
@export var base_stubbornness: int = 50 #willpower basically
@export var modifiers: Array[String] = [] #Example, ["holy", "cartoon", "pacifist"]
