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
# Shoutout https://github.com/trolog/GodotStopWatchAdanced/blob/main/scripts/timer_label.gd
func _process(delta):
	var now = Time.get_unix_time_from_system()
	var time = DeadlineUnix - now
		
	# var mils = fmod(time,1)*1000
	var secs = fmod(time,60)
	var mins = fmod(time, 60*60) / 60
	var hr = fmod(fmod(time,3600 * 60) / 3600,24)
	var dy = fmod(time,12960000) / 86400
	
	self.text = "%02d : %02d : %02d : %02d" % [dy,hr,mins,secs]
