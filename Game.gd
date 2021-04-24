#tool
#class_name
extends Node

#signal
#enums
#constants
#exported variables
#public variables
var President = "Test Pres"
var VP = "Test VP"
var Country = "Test Country"
var Debt = 0
var Popularity = 100.00
var Population = 100
var Month = 1
var Year = 2021
var Date_Text = ""
var GDP = 100
var GDP_Ratio = 1.0
var Gloabl_Prestige = 10


var End_Debt_Amount = -28000
#private variables

####################
#INHERITED METHODS #	
####################


##################
# PUBLIC METHODS #
##################
func start_game():
	Debt = 0
	Popularity = 100.00
	Month = 1
	Year = 2021
	set_date_text()
	
func next_turn():
	progress_month()
	change_popularity(-1.25)
	change_debt(-750)

###################
# PRIVATE METHODS #	
###################
func change_popularity(amount):
	Popularity = clamp(Popularity + amount, 0 , 100)
	SignalBus.emit_signal("updated_Popularity", Popularity)
	
func change_debt(amount):
	Debt = Debt + amount
	SignalBus.emit_signal("updated_Debt", Debt)
	
func change_gloabl_prestige(amount):
	Gloabl_Prestige = Gloabl_Prestige + amount
	SignalBus.emit_signal("updated_Gloabl_Prestige", Gloabl_Prestige)

func progress_month():
	Month += 1
	if(Month > 12):
		Month = 1
		Year += 1
	set_date_text()
	SignalBus.emit_signal("updated_Date_Text", Date_Text)

func set_date_text():
	match Month:
		1:
			Date_Text = "Jan"
		2:
			Date_Text = "Feb"
		3:
			Date_Text = "Mar"
		4:
			Date_Text = "Apr"
		5:
			Date_Text = "May"
		6:
			Date_Text = "June"
		7:
			Date_Text = "July"
		8:
			Date_Text = "Aug"
		9:
			Date_Text = "Nov"
		10:
			Date_Text = "Oct"
		11:
			Date_Text = "Nov"
		12:
			Date_Text = "Dec"
	
	Date_Text = Date_Text + "-" + str(Year) 
	
func get_debt_text(num):
	var value = ""
	if(abs(num) > 1000):
		value = str(float(num)/1000) + "T"
	else:
		value = str(abs(num)) + "B"
	if(num < 0):
		return "-$" + value
	else:
		return "$" + value
