extends ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scroll = get_v_scroll_bar()
	var ad1 = get_node("FlowContainer/add1/ad1")
	ad1.play()
	var ad2 = get_node("FlowContainer/add2/ad2")
	ad2.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
