#!/usr/bin/env sh

HOUR=$(date "+%H")
DAY_TEMPERATURE=6500

case $HOUR in
	19)
		pkill -9 redshift;
		redshift -P -O 6000 > /dev/null;
		;;

	20)
		pkill -9 redshift;
		redshift -P -O 5500 > /dev/null;
		;;

	21)
		pkill -9 redshift;
		redshift -P -O 5000 > /dev/null;
		;;

	22)
		pkill -9 redshift;
		redshift -P -O 4500 > /dev/null;
		;;

	23)
		pkill -9 redshift;
		redshift -P -O 4000 > /dev/null;
		;;

	00)
		pkill -9 redshift;
		redshift -P -O 3500 > /dev/null;
		;;

	01 | 02 | 03 | 04 | 05 | 06 | 07)
		pkill -9 redshift;
		redshift -P -O 3000 > /dev/null;
		;;

	*)
		pkill -9 redshift;
		redshift -P -O $DAY_TEMPERATURE;
		;;
esac
