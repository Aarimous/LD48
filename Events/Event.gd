#tool
class_name Event
extends Node

#signal
#enums
#constants
#exported variables
#public variables
var description = "test"
var event_labels = []
#private variables

####################
#INHERITED METHODS #	
####################
func _init():
	pass

##################
# PUBLIC METHODS #
##################
func fire_event(index):
	print("firing event for index ", index)

###################
# PRIVATE METHODS #	
###################
