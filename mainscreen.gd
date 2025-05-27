extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var play = get_node("Play") 
	var options = get_node("Options")
	var help = get_node("Help")
	var exit = get_node("Exit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	

#called when play button is pressed
func _on_play_pressed() -> void:
	pass
#!!open levels and then go to game

#called when options button is pressed
func _on_options_pressed() -> void:
	pass # Replace with function body.

#called when help button is pressed
func _on_help_pressed() -> void:
	pass # Replace with function body.

#called when exit button is pressed
func _on_exit_pressed() -> void:
	get_tree().quit() 
