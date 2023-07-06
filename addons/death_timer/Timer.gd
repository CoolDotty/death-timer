@tool
extends Control


## YYYY-MM-DDTHH:MM:SS
## See: Time.get_unix_time_from_datetime_string
@export var Deadline: String = "2023-07-09T17:00:00:00"

var DeadlineUnix := 0


# Called when the node enters the scene tree for the first time.
func _ready():
	DeadlineUnix = Time.get_unix_time_from_datetime_string(Deadline)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Shoutout: https://stackoverflow.com/a/36099084
func _process(delta):
	var now = Time.get_unix_time_from_system()
	var time = DeadlineUnix - now
	
	var days = floor(time / (3600 * 24));
	time  -= days * 3600 * 24;
	var hrs   = floor(time / 3600);
	time  -= hrs * 3600;
	var mnts = floor(time / 60);
	time  -= mnts * 60;
	var secs = time
	
	self.text = "%02d : %02d : %02d : %02d" % [days, hrs, mnts, secs]
