#tool
#class_name
extends WindowDialog

#signal
#enums
#constants
#exported variables
export var button_prefab : PackedScene
#public variables
#private variables

####################
#INHERITED METHODS #	
####################
#func _ready():


##################
# PUBLIC METHODS #
##################
func run_event(event):
	$VBoxContainer/Margin/VBoxContainer/Text.text = event.description
	var index = 0
	for label in event.event_labels:
		var option_btn = button_prefab.instance()
		option_btn.set_text(label)
		option_btn.name = str(index)
		$VBoxContainer/Margin/VBoxContainer.add_child(option_btn)
		option_btn.connect("on_button_up", event, "fire_event")
		index += 1
		option_btn.connect("on_button_up", self, "destroy_event_popup")

func destroy_event_popup(name):
	queue_free()
###################
# PRIVATE METHODS #	
###################
