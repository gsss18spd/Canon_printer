# RUN ##############################################
# make -f download_canon.mk

# Source:
#http://askubuntu.com/questions/457774/driver-canon-lbp-2900

source:
	echo "Download: done"
	curl -L -C - http://gdlp01.c-wss.com/gds/6/0100004596/05/linux-capt-drv-v271-uken.tar.gz -o ./drivers.tar.gz

