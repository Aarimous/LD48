#tool
#class_name
extends PanelContainer

#signal
#enums
#constants
#exported variables
export var label = "Label:"
export var value = "Value"
#public variables
#private variables

####################
#INHERITED METHODS #	
####################
func _ready():
	$HBox/Label.text = label
	set_value(value)

func set_value(value):
	$HBox/Value.text = str(value)
	
func set_font(font):
	$HBox/Label.set("custom_fonts/font", font)
	$HBox/Value.set("custom_fonts/font", font)
	
##################
# PUBLIC METHODS #
##################


###################
# PRIVATE METHODS #	
###################
