#tool
#class_name
extends Node2D

#signal
#enums
#constants
#exported variables
#public variables
#private variables

####################
#INHERITED METHODS #	
####################
func _ready():
	Game.start_game()
	$Ui.update()

##################
# PUBLIC METHODS #
##################


###################
# PRIVATE METHODS #	
###################
