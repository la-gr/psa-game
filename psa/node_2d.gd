extends Node2D
#black market
var tween
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var hand2 = get_node("hand2")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
	
	
func _input(event):
	var hand1 = get_node("hand1");
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if (920 > event.position.x > 880):
			pass
		hand1.set_frame(1)
		tween = create_tween()
		tween.tween_property(hand1, "position", event.position, 0.2)
		#hand2.position=event.position
		await get_tree().create_timer(0.5).timeout #waits
		hand1.set_frame(0)
		await get_tree().create_timer(0.2).timeout #waits
		tween.kill() # Abort the previous animation.
		tween = create_tween()
		tween.tween_property(hand1, "position", Vector2(843.0, 421.0), 0.2)
