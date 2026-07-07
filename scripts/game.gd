extends Node2D
@onready var objects = $world/TileMap/Objects
@onready var highlights = $world/TileMap/Highlight
var cell: Vector2i
var old_cell: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta):
	cell = highlights.local_to_map(highlights.get_local_mouse_position())
	if cell != old_cell:
		highlights.erase_cell(old_cell)
		highlights.set_cell(cell, 0, Vector2i(0, 2))
		old_cell = cell
		
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("action_left_click"):
		objects.set_cell(cell, 0, Vector2i(0, 1))
		print("placed an tile!")
