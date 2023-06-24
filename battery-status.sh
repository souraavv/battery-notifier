#!/bin/bash
notif_send=0
notif_send_low=0

export already_called=1
while true
    do 
        battery_level=`cat /sys/class/power_supply/BAT0/capacity`
        battery_status=`cat /sys/class/power_supply/BAT0/status`
        if [ $battery_status = "Charging" ] && [ $battery_level -ge 90 ] && [ $notif_send -eq 0 ];
        then
            notify-send -u low "Hey Sourav, Battery is charged more than $battery_level%"
	    paplay /usr/share/sounds/freedesktop/stereo/message.oga
	    notif_send=1

    	elif [ $battery_status = "Discharging" ] && [ $battery_level -le 25 ] && [ $notif_send_low -eq 0 ];
	then 
		notify-send -u critical "Low Battery ($battery_level)% left, where is the charger ?"	
		paplay /usr/share/sounds/freedesktop/stereo/message.oga
		notif_send_low=1
	fi
	if [ $battery_status = "Discharging" ];
	then
		notif_send=0
	fi

	if [ $battery_status = "Charging" ];
	then
		notif_send_low=0
	fi

        sleep 200
    done


        
