extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var play = get_node("Play") 
	var options = get_node("Options")
	var help = get_node("Help")
	var exit = get_node("Exit")
	var lvlSelect = get_node("Level Select")
	var optionsMenu = get_node("OptionsMenu")
	
	lvlSelect.set_visible(false)
	optionsMenu.set_visible(false)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	

#called when play button is pressed
func _on_play_pressed() -> void:
	var lvlSelect = get_node("Level Select")
	lvlSelect.set_visible(true); 

#called when options button is pressed
func _on_options_pressed() -> void:
	var optionsMenu = get_node("OptionsMenu")
	optionsMenu.set_visible(true)


#called when help button is pressed
func _on_help_pressed() -> void:
	pass # Replace with function body.

#called when exit button is pressed
func _on_exit_pressed() -> void:
	get_tree().quit() 

#blackmarket episode is pressed
func _on_black_market_pressed() -> void:
	get_tree().change_scene_to_file("res://blackMarket.tscn") 

#close level selection
func _on_exit_levels_pressed() -> void:
	var lvlSelect = get_node("Level Select")
	lvlSelect.set_visible(false)


func _on_exit_options_pressed() -> void:
	pass # Replace with function body.
