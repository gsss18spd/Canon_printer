# RUN ##############################################
# make -f OS_restart.mk

# Source:
#http://askubuntu.com/questions/457774/driver-canon-lbp-2900

restart:
	echo "On restart:"
	sudo pkill -9 -x ccpd
	sudo pkill -9 -x captmoncnabc
	sudo /etc/init.d/ccpd start
	sudo /etc/init.d/ccpd status
