extends Node2D
#black market
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var hand1 = get_node("hand1")
	print("hello")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	hands()

func hands() -> void:
	print("hands")
	
func _input(event):
	var hand2 = get_node("hand2");
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		hand2.position(event.position)
		print(event.position)
