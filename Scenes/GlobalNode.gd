extends Node

var BodyList : Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BodyList.clear()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func AddBody(body_pos : Vector3):
	BodyList.append(body_pos)
	return BodyList.size()

func GetBodyListSize():
	return BodyList.size()

func GetBodyListElement(EleNum):
	return BodyList[EleNum]
