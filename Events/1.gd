#tool
#class_name
extends Event

#signal
#enums
#constants
#exported variables
#public variables
#private variables

####################
#INHERITED METHODS #	
####################
func _init():
	description = "Your people are in need of more gass for their cars. We are at risk of our GDP falling if we do nothing. Mr. President what shall we do?"
	event_labels.push_back("1: Buy off you're citzens. Incease you popularioty by 10 and increase the national debt by 100B 1: Buy off you're citzens. Incease you popularioty by 10 and increase the national debt by 100B")
	event_labels.push_back("2: Invest in the middle east. Increase you global perstige by 100 and increase the national debt by 1T")
	event_labels.push_back("3: Tax break for your friends, cuz why not? Increase the DEBT by 500B, decrease you're populairty by 5%")

##################
# PUBLIC METHODS #
##################
func fire_event(index):
	var i = int(index)
	match i:
		0:
			Game.change_debt(-100)
			Game.change_popularity(10)
		1:
			Game.change_debt(-1000)
			Game.change_gloabl_prestige(100)
		2:
			Game.change_debt(-500)
			Game.change_popularity(-5)

###################
# PRIVATE METHODS #	
###################
