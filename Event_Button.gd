#tool
#class_name
extends Button

#signal
signal on_button_up(name)
#enums
#constants
#exported variables
#public variables
#private variables

####################
#INHERITED METHODS #	
####################
func _ready():
	resize()

##################
# PUBLIC METHODS #
##################


###################
# PRIVATE METHODS #	
###################
func set_text(value):
	$MarginContainer/Label.text = value
	resize()
	
func resize():
	rect_min_size = $MarginContainer.rect_size
	
func _on_Button_button_up():
	emit_signal("on_button_up", name)
