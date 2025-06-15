extends Node2D
#black market
var tween
var num = 1
var popupNum = 0
var hand1
var gn = false
var bn = false
var baby = false
var itemsBought = 0
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
	var gunText = get_node("handGun")
	gunText.set_visible(false)
	var popupAd = get_node("popup ad")
	popupAd.set_visible(false)
	var popupTrap = get_node("popup trap")
	popupTrap.set_visible(false)
	var gotcha = get_node("gotcha")
	gotcha.set_visible(false)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if popupNum==5:
		blinds()
		popupNum = 0
	
	
func _input(event):
	hand1 = get_node("hand1");
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		var b = event.position.x
		hand1.set_frame(1)
		tween = create_tween()
		tween.tween_property(hand1, "position", event.position, 0.2)
		var touch = get_node("touch")
		#touch.play()
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
			var handGun = get_node("handGun")
			handGun.set_frame(1)
			await get_tree().create_timer(0.5).timeout #waits
			handGun.set_frame(2)
			var shot = get_node("gunshot")
			var crak = get_node("crack")
			shot.play()
			crak.set_visible(true)
			await get_tree().create_timer(0.3).timeout #waits
			handGun.set_frame(1)
			await get_tree().create_timer(0.7).timeout #waits
			handGun.set_frame(0)
			life_lost(1)
		if (event.keycode == KEY_B) and (bn == true):
			var close = get_node("closing blinds")
			close.play()
			await get_tree().create_timer(3).timeout #wait that many seconds
			#set screen back to normal and get rid of the text
			var white = get_node("white")
			var black = get_node("black")
			white.set_visible(false)
			black.set_visible(false)
			var clikBlind = get_node("clikBlind") 
			clikBlind.set_visible(false)
			bn = false

func gun() -> void:
	var shot = get_node("gunshot")
	shot.play()
	await get_tree().create_timer(1.5).timeout #waits
	var baby = get_node("kid gun")
	baby.set_visible(true)
	await get_tree().create_timer(3).timeout #waits
	#have gun in left hand
	var hand2 = get_node("hand2")
	hand2.set_visible(false)
	var gunText = get_node("handGun") #press A to shoot, text
	gunText.set_visible(true)
	gn = true
	baby.set_visible(false)
	
func blinds() -> void:
	#make screen dark and everthing else light
	var white = get_node("white")
	var black = get_node("black")
	white.set_visible(true)
	black.set_visible(true)
	var mom = get_node("blindsmom")
	mom.play()
	await get_tree().create_timer(2).timeout
	#show text to click B to close blinds
	var clikBlind = get_node("clikBlind") 
	clikBlind.set_visible(true)
	bn = true

func life_lost(way) -> void:
	var lives = get_node("lives")
	var o = lives.get_frame()
	var loseHeart = get_node("lose heart")
	var endings = get_node("ENDINGS")
	var endText = get_node("ENDINGS/endText")
	if (o!=2):
		loseHeart.play()
		lives.set_frame(o+1)
	else:
		var popupSound = get_node("popup sound")
		popupSound.volume_db = -30.0
		loseHeart.play()
		lives.set_frame(o+1)
		await get_tree().create_timer(1.5).timeout #waits
		endings.set_frame(way)
		if (way == 1):
			var have = get_node("haveaGun")
			var catch = get_node("ENDINGS/momcatch")
			have.play()
			await get_tree().create_timer(3).timeout #waits
			endText.text = "Your mom catches you on the Black Market. You will NEVER see an IPad again..."
			endings.set_visible(true)
			await get_tree().create_timer(1).timeout #waits
			catch.play()
			await get_tree().create_timer(8).timeout #waits
		elif (way == 2):
			var poli = get_node("ENDINGS/police")
			endText.text = "The police catch you on the Black Market. You are arrested, and sent to jail for 10 years..."
			endings.set_visible(true)
			await get_tree().create_timer(1).timeout #waits
			poli.play()
			await get_tree().create_timer(10).timeout #waits
		get_tree().change_scene_to_file("res://mainscreen.tscn") 

		
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
	itemsBought += 1
	if (itemsBought == 16):
		var endings = get_node("ENDINGS")
		var endText = get_node("ENDINGS/endText")
		var package = get_node("ENDINGS/packages")
		endings.set_frame(0)
		endText.text = "The items that you bought on the Black Market are delivered, but, your mom gets to them first."
		endings.set_visible(true)
		package.play()
		await get_tree().create_timer(7).timeout
		endings.set_frame(1)
		endText.text = "She takes away your IPad, and calls the police on you."
		await get_tree().create_timer(2).timeout
		endings.set_frame(2)
		endText.text = "You are arrested and sent to jail for many years..."
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://mainscreen.tscn")
	if (baby):
		gun()
		baby = false

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
	baby = true

func _on_close_popup_pressed() -> void:
	var buttonClick = get_node("button click")
	buttonClick.play()
	var popupAd = get_node("popup ad")
	popupAd.set_visible(false)
	#cycle through the ads
	popupAd.frame = (popupAd.frame + 1) % popupAd.sprite_frames.get_frame_count(popupAd.animation)


func _on_popup_timer_timeout() -> void:
	var popupSound = get_node("popup sound")
	popupSound.play()
	var popupAd = get_node("popup ad")
	popupAd.set_visible(true)
	popupNum = popupNum+1


func _on_confirm_usage_pressed() -> void:
	var buttonClick = get_node("button click")
	buttonClick.play()
	var popupTrap = get_node("popup trap")
	popupTrap.set_visible(false)
	life_lost(2)


func _on_popup_trap_timer_timeout() -> void:
	var popupSound = get_node("popup sound")
	popupSound.play()
	var popupTrap = get_node("popup trap")
	popupTrap.set_visible(true)


func _on_close_trap_popup_pressed() -> void:
	var buttonClick = get_node("button click")
	buttonClick.play()
	var popupTrap = get_node("popup trap")
	popupTrap.set_visible(false)


func _on_gotcha_timer_timeout() -> void:
	var popupSound = get_node("popup sound")
	popupSound.play()
	var gotcha = get_node("gotcha")
	gotcha.set_visible(true)


func _on_timer_22_timeout() -> void:
	var goal = get_node("GOAL")
	goal.set_visible(false)
