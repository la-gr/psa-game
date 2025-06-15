extends HSlider  # Attach this script to the slider

@onready var puzzle = $"puzzle piece"  # Assuming it's a child
var targetX = 80
var buffer = 5.0

func _ready() -> void:
	connect("value_changed", Callable(self, "_on_value_changed"))
	_on_value_changed(value)

func _on_value_changed(value: float) -> void:
	var percent = value / max_value
	puzzle.position.x = percent * size.x

func _on_mouse_exited() -> void:
	release_focus()
	var current_value = (puzzle.position.x / size.x) * max_value
	print("Slider value at current x:", current_value)
	
	if current_value >= targetX-buffer && current_value <= targetX+buffer :
		print("Puzzle piece is at the target!")
		get_parent().visible = false
