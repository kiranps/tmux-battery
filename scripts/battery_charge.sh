#!/bin/bash
charge=`upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep "percentage"|tr -d 'a-zA-Z: '|sed s/.[^.]*$//`

blocks=$(( charge/10 ))

bat_remaing=""
bat_consumed=""
bat_digit=$charge"%"

for (( i = 0; i < $blocks; i++ )); do 
    bat_remaing+=" ";
done

for (( i = $blocks; i < 10; i++ )); do 
    bat_consumed+=" "
done

case $1  in
    r)
        echo "$bat_remaing";;
    c)
        echo "$bat_consumed";;
    d)
        echo "$bat_digit";;
esac
