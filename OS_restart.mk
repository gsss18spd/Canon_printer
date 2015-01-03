# RUN ##############################################
# make -f OS_restart.mk

restart:
	echo "On restart:"
	sudo pkill -9 -x ccpd
	sudo pkill -9 -x captmoncnabc
	sudo /etc/init.d/ccpd start
	sudo /etc/init.d/ccpd status
