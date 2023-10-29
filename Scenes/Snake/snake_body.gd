extends Area3D

@onready var GlobalNode = get_node("/root/GlobalNode")

#const BODY_OFFSET = -60

var ListNumber = 0
var offset = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var parent_pos : Vector3
	parent_pos  = GlobalNode.GetBodyListElement(ListNumber-1)
	#var parent_pos = GlobalNode.BodyList[ListNumber-1]
	if ListNumber==2:
		offset=-1

	position.x = (parent_pos.x + (ListNumber * offset))
	position.y = parent_pos.y
	pass

func set_start_position(pos, _Number):
	ListNumber = _Number
	position = pos

	print("First Entry:", _Number)
	if ListNumber==2:	#初めてのボディは_Number2で入ってくるのでちょっとアタマに近づけてやる　
		offset=-1
	position.x = (position.x + (ListNumber * offset))

