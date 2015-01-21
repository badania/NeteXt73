#!/bin/bash

if [ "$1" = "kontakty" ]; then
	KEY="$(echo $RANDOM)"
	#zmienne losowe
	res1=$(mktemp --tmpdir=/tmp/netext73 netext73_1.XXXXXXXX)
	res2=$(mktemp --tmpdir=/tmp/netext73 netext73_2.XXXXXXXX)
	res3=$(mktemp --tmpdir=/tmp/netext73 netext73_3.XXXXXXXX)

	yad-netext --plug=$KEY --tabnum=1 --icons --image-on-top --single-click --item-width=150 --read-dir=/opt/NeteXt73/kontakty &> $res1 &
	yad-netext --plug=$KEY --tabnum=2 --text-info --filename=/opt/NeteXt73/changelog &> $res2 &
	yad-netext --plug=$KEY --tabnum=3 --text-info --filename=/opt/NeteXt73/LICENSE &> $res3 &
	yad-netext --notebook --key=$KEY --center --title="$nazwa_skryptu1 " --tab="$TEXT_KONTAKT_Z_AUTORAMI" --tab="$TEXT_CHANGELOG" --tab="$TEXT_LICENCJA" --window-icon="/opt/NeteXt73/ikony/mail.png" --on-top --width=840 --height=400 --button="$TEXT_ZAMKNIJ:1" --button="$TEXT_BUG:2"
	klawisz=$?

	if [ "$klawisz" = "2" ]; then
		xdg-open "http://www.netext73.pl/2014/02/netext73-zgaszanie-bedow.html"
	fi
elif [ "$1" = "logi" ]; then
	xdg-open $(cat netext.log dmesg.log kern.log | pastebinit)  
fi