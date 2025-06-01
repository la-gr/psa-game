extends Node2D
#black market
var tween
var num = 1
var hand1
var items = ["Cyber", "dog"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var hand2 = get_node("hand2")
	var pop_up = get_node("popup")
	pop_up.set_visible(false)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
	
	
func _input(event):
	hand1 = get_node("hand1");
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		var b = event.position.x
		hand1.set_frame(1)
		tween = create_tween()
		tween.tween_property(hand1, "position", event.position, 0.2)
		await get_tree().create_timer(0.5).timeout #waits
		hand1.set_frame(0)
		await get_tree().create_timer(0.2).timeout #waits
		var l = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
		#print(l)
		if (!l):
			tween.kill() # Abort the previous animation.
			tween = create_tween()
			tween.tween_property(hand1, "position", Vector2(843.0, 421.0), 0.2)

		
func but_click(n) -> void:
	num=n
	var pop_up = get_node("popup")
	await get_tree().create_timer(0.7).timeout #waits
	pop_up.set_visible(true)
	pop_up.set_frame(n)


func _on_button_pressed() -> void:
	but_click(0)

func _on_button_2_pressed() -> void:
	but_click(1)

func _on_button_3_pressed() -> void:
	but_click(0)

func _on_pop_but_pressed() -> void:
	#var p = items[num]
	var group = get_node("scroll/FlowContainer/"+items[num])
	var pop_up = get_node("popup")
	await get_tree().create_timer(0.7).timeout
	group.set_visible(false)
	pop_up.set_visible(false)
