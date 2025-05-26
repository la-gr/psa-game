extends Node2D
#black market
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var hand1 = get_node("hand1")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	hands()

func hands() -> void:
	var hand1 = 2
	
func _input(event):
	var hand2 = get_node("hand2");
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		hand2.set_frame(1)
		var tween = create_tween()
		tween.tween_property(hand2, "position", event.position, 0.2)
		#hand2.position=event.position
		await get_tree().create_timer(0.5).timeout #waits
		hand2.set_frame(0)
		await get_tree().create_timer(0.2).timeout #waits
		tween.kill() # Abort the previous animation.
		tween = create_tween()
		tween.tween_property(hand2, "position", Vector2(891.0, 342.0), 0.2)
