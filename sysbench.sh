#!/bin/bash

#zmienne
a0="Doing"
a1="Number of threads:"
a2="total time:"
a3="total number of events:"
a4="total time taken by event execution:"
a5="min:"
a6="avg:"
a7="max:"
a8="approx.  95 percentile:"
a9="events (avg/stddev):"
a10="execution time (avg/stddev):"
MENU1="CPU sysbench test"
MENU2="Memory sysbench test"
MENU3="CPU sysbench table tests"
MENU4="Memory sysbench table tests"
menu="$MENU1!$MENU2!$MENU3!$MENU4"

#procedury

info_test(){
yad-netext --center --info --title="nazwa_skryptu"  --window-icon="/opt/NeteXt73/ikony/info.png" --image="/opt/NeteXt73/ikony/info.png" --button="gtk-ok:0" --text="Trwa test $2 Sysbench,\npo jego zakończeniu \npojawi się tabela z wynikiem." --timeout=$1
}

zrob_test(){
DATE=$(date +"%Y-%m-%d@%H:%M")
if [ "$2" = "cpu" ]; then
      echo "uname $(uname -r)" > cpu_$(uname -r)_$DATE-sysbench.log 
      sysbench --num-threads=$1 --test=cpu run >> cpu_$(uname -r)_$DATE-sysbench.log  
      echo "test_time : " $DATE >> cpu_$(uname -r)_$DATE-sysbench.log  
else
      echo "uname $(uname -r)" > memory_$(uname -r)_$DATE-sysbench.log
      sysbench --num-threads=$1 --test=memory run >> memory_$(uname -r)_$DATE-sysbench.log 
      echo "test_time : " $DATE >> memory_$(uname -r)_$DATE-sysbench.log  
fi
}



wynik_testu(){
a=$(yad-netext --center --title="nazwa_skryptu" --width=610 --window-icon="/opt/NeteXt73/ikony/netext.png" --image="/opt/NeteXt73/ikony/netext.png" --button="gtk-ok:0" --form \
--field="uname -r:RO" "$(grep "uname" $1 | cut -d " " -f 2 )" \
--field="$(grep "$a0" $1 | sed 's/Doing //'):RO" "YES" \
--field="$a1:RO" "$(grep "$a1" $1 | sed 's/.*: *//')" \
--field="Test execution summary - $a2:RO" "$(grep "$a2" $1 | sed 's/.*: *//')" \
--field="Test execution summary - $a3:RO" "$(grep "$a3" $1 | sed 's/.*: *//')" \
--field="Test execution summary - $a4:RO" "$(grep "$a4" $1 | sed 's/.*: *//')" \
--field="per-request statistics $a5:RO" "$(grep "$a5" $1 | sed 's/.*: *//')" \
--field="per-request statistics $a6:RO" "$(grep "$a6" $1 | sed 's/.*: *//')" \
--field="per-request statistics $a7:RO" "$(grep "$a7" $1 | sed 's/.*: *//')" \
--field="per-request statistics $a8:RO" "$(grep "$a8" $1 | sed 's/.*: *//')" \
--field="Threads fairness $a9:RO" "$(grep "$a9" $1 | sed 's/.*: *//')" \
--field="Threads fairness $a10:RO" "$(grep "$a10" $1 | sed 's/.*: *//')" ) 
}


porownanie(){
rm pliki -f
for i in $(ls *sysbench.log | grep $1 ); do
      if [ "$(grep test_time $i)" = "" ]; then
	  rm $i
      else
	  grep "uname" $i | cut -d " " -f 2 >> pliki
	  grep "test_time" $i | sed 's/test_time : *//' >> pliki
	  grep "$a1" $i | sed 's/.*: *//' >> pliki
	  grep "$a2" $i | sed 's/.*: *//' >> pliki
	  grep "$a3" $i | sed 's/.*: *//' >> pliki
	  grep "$a4" $i | sed 's/.*: *//' >> pliki
	  grep "$a5" $i | sed 's/.*: *//' >> pliki
	  grep "$a6" $i | sed 's/.*: *//' >> pliki
	  grep "$a7" $i | sed 's/.*: *//' >> pliki
	  grep "$a8" $i | sed 's/.*: *//' >> pliki
	  grep "$a9" $i | sed 's/.*: *//' >> pliki
	  grep "$a10" $i | sed 's/.*: *//' >> pliki
      fi
done
yad-netext --center --title="nazwa_skryptu" --text="$1 test" --width=1024 --height=450 --window-icon="/opt/NeteXt73/ikony/netext.png" --image="/opt/NeteXt73/ikony/netext.png" \
--column="uname -r" --column="test dates:" --column="$(echo $a1 | sed 's/ of/\nof/')" --column="$a2" --column="$(echo $a3 | sed 's/ of/\nof/')" --column="$(echo $a4 | sed 's/ event/\nevent/' | sed 's/ taken/\ntaken/' )" --column="$a5"  --column="$a6" --column="$a7" --column="$(echo $a8 | sed 's/ 95/\n95/')" --column="$(echo $a9 | sed 's/(/\n(/')" --column="$(echo $a10 | sed 's/(/\n(/')" --list $(cat pliki) --button="gtk-ok:0" 
rm pliki -f
}

petla="tak"
while [ $petla = "tak" ]; do
	skrypt=$(yad-netext --center --title="$nazwaskryptu" --window-icon="/opt/NeteXt73/ikony/skrypty.png" --image="/opt/NeteXt73/ikony/skrypty.png" --form --field="TEXT_SKRYPT1:CB" "$menu" --button="gtk-ok:0" --button="TEXT_POWROT:1"  )
	klawisz=$?; skrypt=$(echo $skrypt | cut -d "|" -f 1)
	if [ $klawisz = 0 ]; then
		if [ "$skrypt" = "$MENU1" ]; then
		    info_test 5 CPU & 
		    zrob_test $(grep 'model name' /proc/cpuinfo | wc -l ) cpu 
		    wynik_testu cpu_$(uname -r)_$DATE-sysbench.log 
		elif [ "$skrypt" = "$MENU2" ]; then
		    info_test 15 MEMORY &
		    zrob_test $(grep 'model name' /proc/cpuinfo | wc -l ) memory
		    wynik_testu memory_$(uname -r)_$DATE-sysbench.log
		elif [ "$skrypt" = "$MENU3" ]; then
		    porownanie cpu
		elif [ "$skrypt" = "$MENU4" ]; then
		    porownanie memory
		fi
	fi
	if [ -z "$skrypt" ]; then
	      petla="nie"
	fi
done