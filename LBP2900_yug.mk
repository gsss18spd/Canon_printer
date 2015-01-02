# RUN ##############################################
# make -f LBP2900.mk BITS=32

#http://askubuntu.com/questions/457774/driver-canon-lbp-2900
BITS=32
unzip:
	gunzip -c drivers.tar.gz | tar xopf -

deb_install: unzip
	read -p "Computer bits-rate ? (32 or 64)" BITS
	if [ $(BITS) = 32 ] ; then \
	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/32-bit_Driver/Debian/cndrvcups-common_2.60-1_i386.deb ;\
	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/32-bit_Driver/Debian/cndrvcups-capt_2.60-1_i386.deb   ;\
	fi;
	if [ $(BITS) = 64 ] ; then \
	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-common-2.60-1_amd64.deb ;\
	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-capt_2.60-1_amd64.deb   ;\
	fi;
#	[[ $(BITS) == 64 ]] { \
#	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-common-2.60-1.x86_64.deb ;\ #64bits
#	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-capt-2.60-1.x86_64.deb   ;\ #64bits
#	}
missing_folders: unzip
	sudo mkdir /var/ccpd
	sudo mkfifo /var/ccpd/fifo0
	sudo mkdir /var/captmon

register_printer: missing_folders
	sudo /usr/sbin/lpadmin -p LBP2900 -m CNCUPSLBP2900CAPTK.ppd -v ccp:/var/ccpd/fifo0 -E
	sudo /usr/sbin/ccpdadmin -p LBP2900 -o /dev/usb/lp0 

start_daemon: register_printer
	sudo /etc/init.d/ccpd start








