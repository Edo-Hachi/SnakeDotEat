extends CharacterBody3D

const MOVE_SPEED = 20
const ProcessCaptureInterval = 10

@onready var GlobalNode = get_node("/root/GlobalNode")

var SnakeBody = preload("res://Scenes/Snake/snake_body.tscn")

@onready var snake_head_00: MeshInstance3D = $SnakeHead00
@onready var snake_head_02: MeshInstance3D = $SnakeHead02


var BodyCount = 1
var BodyOffset = 8

var ProcessCount= 0
var FaceAnim = 0

func _ready() -> void:
	var ArryaSize = GlobalNode.AddBody(position)


func _physics_process(delta: float) -> void:

	#MoveUp
	if Input.is_action_pressed("ui_moveup"): #and is_on_floor():
		velocity.y += (MOVE_SPEED * 1.5) * delta
	else:
		velocity.y -= MOVE_SPEED * delta

	if Input.is_action_just_pressed("ui_append"):
		var ArryaSize = GlobalNode.AddBody(position)

		var body = SnakeBody.instantiate()
		body.set_start_position(position, ArryaSize)
		get_parent().add_child(body)

	if ProcessCount % ProcessCaptureInterval== 0:
		GlobalNode.BodyList.push_front(position)
		GlobalNode.BodyList.pop_back()

	#print(GlobalNode.BodyList.size())

	ProcessCount+=1

	move_and_slide()


func _on_animation_timer_timeout() -> void:

	#$SnakeHead00.visiblity == false
	#$SnakeHead02.visiblity == false

	#print(ProcessCount)

	if FaceAnim % 2 == 0:
		print("face 01")
		snake_head_00.visible == false
		snake_head_02.visible == false
	else:
		print("face 02")

		snake_head_00.visible == false
		snake_head_02.visible == false

	FaceAnim+=1
