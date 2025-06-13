extends Node2D


func _on_black_market_finished() -> void:
	var bm = get_node("BlackMarket")
	bm.set_visible(false)
