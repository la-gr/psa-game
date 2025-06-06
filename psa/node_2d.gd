extends Node2D
#black market
var tween
var num = 1
var hand1
var gn = false
var items = ["Cyber", "dog", "flour", "Cat", "House", "Couch", 'Tree', "foot", "worm", "shoe", "worm2", "man", "Baby pic", "Phone", "cheese", "baby"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var hand2 = get_node("hand2")
	var pop_up = get_node("popup")
	pop_up.set_visible(false)
	var baby = get_node("kid gun")
	baby.set_visible(false)
	var crack = get_node("crack")
	crack.set_visible(false)

	
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
		if (!l):
			tween.kill() # Abort the previous animation.
			tween = create_tween()
			tween.tween_property(hand1, "position", Vector2(843.0, 421.0), 0.2)
	if event is InputEventKey and event.pressed: #user clicks the A key
		if (event.keycode == KEY_A) and (gn == true):
			var shot = get_node("gunshot")
			var crak = get_node("crack")
			shot.play()
			crak.set_visible(true)

func gun() -> void:
	var shot = get_node("gunshot")
	shot.play()
	await get_tree().create_timer(1.5).timeout #waits
	var baby = get_node("kid gun")
	baby.set_visible(true)
	await get_tree().create_timer(5).timeout #waits
	#have gun in left hand
	#press A to shoot at bottom
	gn = true
	baby.set_visible(false)

func life_lost() -> void:
	var lives = get_node("lives")
	var o = lives.get_frame()
	if (o!=0):
		lives.set_frame(o-1)
	else:
		pass #end game
		
func but_click(n) -> void:
	var clik = get_node("button click")
	clik.play()
	num=n
	var pop_up = get_node("popup")
	await get_tree().create_timer(0.7).timeout #waits
	pop_up.set_visible(true)
	pop_up.set_frame(n)

func _on_pop_but_pressed() -> void:
	var clik = get_node("button click")
	clik.play()
	var group = get_node("scroll/FlowContainer/"+items[num])
	var pop_up = get_node("popup")
	await get_tree().create_timer(0.7).timeout
	group.set_visible(false)
	pop_up.set_visible(false)

func _on_button_pressed() -> void:
	but_click(0)
func _on_button_2_pressed() -> void:
	but_click(1)
func _on_button_3_pressed() -> void:
	but_click(2)
func _on_button_4_pressed() -> void:
	but_click(3)
func _on_button_5_pressed() -> void:
	but_click(4)
func _on_button_6_pressed() -> void:
	but_click(5)
func _on_button_7_pressed() -> void:
	but_click(6)
func _on_button_8_pressed() -> void:
	but_click(7)
func _on_button_9_pressed() -> void:
	but_click(8)
func _on_button_10_pressed() -> void:
	but_click(9)
func _on_button_11_pressed() -> void:
	but_click(10)
func _on_button_12_pressed() -> void:
	but_click(11)
func _on_button_13_pressed() -> void:
	but_click(12)
func _on_button_14_pressed() -> void:
	but_click(13)
func _on_button_15_pressed() -> void:
	but_click(14)
func _on_button_16_pressed() -> void:
	but_click(15)
