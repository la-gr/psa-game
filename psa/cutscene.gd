extends Node2D


func _on_black_market_finished() -> void:
	var bm = get_node("BlackMarket")
	bm.set_visible(false)
	var vac = get_node("vaccuum")
	vac.play()
	get_parent().get_node("gotcha/gotcha timer").start()
	get_parent().get_node("popup ad/popup timer").start()
	get_parent().get_node("popup trap/popup trap timer").start()


func _on_vaccuum_finished() -> void:
	var vac = get_node("vaccuum")
	vac.play()
