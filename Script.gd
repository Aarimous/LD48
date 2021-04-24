#tool
#class_name
extends Control

#signal
#enums
#constants
#constants
#exported variables
export(Array,Color) var negative_colors
export(Array,Font) var fonts_by_size
export var event_popup : PackedScene
var president
var vp
var country
var date
var debt
var popularity
var population
var gdp
var gdp_ratio
var global_prestige

#public variables
#private variables

####################
#INHERITED METHODS #	
####################
func _ready():
	president = find_node("President")
	vp = find_node("VP")
	country = find_node("Country")
	date = find_node("Date")
	debt = find_node("Debt")
	popularity = find_node("Popularity")
	population = find_node("Population")
	gdp = find_node("GDP")
	gdp_ratio = find_node("GDP_Ratio")
	global_prestige = find_node("Global_Prestige")
	
	update()
	SignalBus.connect("updated_President",self,"_on_updated_President")
	SignalBus.connect("updated_VP",self,"_on_updated_VP")
	SignalBus.connect("updated_Country",self,"_on_updated_Country")
	SignalBus.connect("updated_Date_Text",self,"_on_updated_Date_Text")
	SignalBus.connect("updated_Debt",self,"_on_updated_Debt")
	SignalBus.connect("updated_Popularity",self,"_on_updated_Popularity")
	SignalBus.connect("updated_Population",self,"_on_updated_Population")
	SignalBus.connect("updated_Month",self,"_on_updated_Month")
	SignalBus.connect("updated_Year",self,"_on_updated_Year")
	SignalBus.connect("updated_GDP",self,"_on_updated_GDP")
	SignalBus.connect("updated_GDP_Ratio",self,"_on_updated_GDP_Ratio")
	SignalBus.connect("updated_Gloabl_Prestige",self,"_on_updated_Gloabl_Prestige")

##################
# PUBLIC METHODS #
##################
func update():
	_on_updated_President(str(Game.President))
	_on_updated_VP(str(Game.VP))
	_on_updated_Country(str(Game.Country))
	_on_updated_Date_Text(str(Game.Date_Text))
	_on_updated_Debt(Game.Debt)
	_on_updated_Popularity(str(Game.Popularity))
	_on_updated_Population(str(Game.Population))
	_on_updated_GDP(str(Game.GDP))
	_on_updated_GDP_Ratio(str(Game.GDP_Ratio))
	_on_updated_Gloabl_Prestige(str(Game.Gloabl_Prestige))

###################
# PRIVATE METHODS #	
###################
func _on_updated_President(new_text):
	president.set_value(str(new_text))
	
func _on_updated_VP(new_text):
	vp.set_value(str(new_text))
	
func _on_updated_Country(new_text):
	country.set_value(str(new_text))
	
func _on_updated_Debt(new_value):
	var index = 0
	if(new_value >= 0):
		index = 0
	elif(new_value >= Game.End_Debt_Amount * .1):
		index = 1
	elif(new_value >= Game.End_Debt_Amount * .2):
		index = 2
	elif(new_value >= Game.End_Debt_Amount * .3):
		index = 3
	elif(new_value >= Game.End_Debt_Amount * .4):
		index = 4
	elif(new_value >= Game.End_Debt_Amount * .5):
		index = 5
	elif(new_value >= Game.End_Debt_Amount * .6):
		index = 6
	elif(new_value >= Game.End_Debt_Amount * .7):		
		index = 7
	elif(new_value >= Game.End_Debt_Amount * .8):		
		index = 8
	else:	
		index = 9
		
	if(index > 4):
		debt.set_font(fonts_by_size[1])
	else:
		debt.set_font(fonts_by_size[0])
	debt.modulate = negative_colors[index]
	debt.set_value(Game.get_debt_text(new_value))
	
func _on_updated_Popularity(new_text):
	popularity.set_value(str(new_text))
	
func _on_updated_Population(new_text):
	population.set_value(str(new_text))

func _on_updated_GDP(new_text):
	gdp.set_value(str(new_text))
	
func _on_updated_GDP_Ratio(new_text):
	gdp_ratio.set_value(str(new_text))
	
func _on_updated_Gloabl_Prestige(new_text):
	global_prestige.set_value(str(new_text))

func _on_updated_Date_Text(new_text):
	date.set_value(str(new_text))
			
func _on_Next_Month_button_up():
	Game.next_turn()
	var pop = event_popup.instance()
	add_child(pop)
	var event = load("res://Events/1.gd").new()
	pop.run_event(event)
	pop.popup()
