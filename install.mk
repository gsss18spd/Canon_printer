# RUN ##############################################
# sudo make -f install_alternative.mk BITS=64 PRINTER=LBP2900

#http://askubuntu.com/questions/457774/driver-canon-lbp-2900

register_printer: missing_folders
	service cups restart
	sudo /etc/init.d/ccpd start
	sudo lpadmin -p $(PRINTER) -m CNCUPS$(PRINTER)CAPTK.ppd -v ccp:/var/ccpd/fifo0 -E
	sudo ccpdadmin -p $(PRINTER) -o /dev/usb/lp0
	sudo update-rc.d ccpd defaults
	sudo service ccpd status

missing_folders: deb_install
	sudo mkdir -p /var/ccpd 
	sudo rm -f /var/ccpd/fifo0
	sudo mkfifo   /var/ccpd/fifo0
	sudo mkdir -p /var/captmon

deb_install: unzip
	if [ $(BITS) = 32 ] ; then \
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/32-bit_Driver/Debian/cndrvcups-common_2.60-1_i386.deb ;\
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/32-bit_Driver/Debian/cndrvcups-capt_2.60-1_i386.deb   ;\
	fi;
	if [ $(BITS) = 64 ] ; then \
		sudo apt-get install libc6:i386 libpopt0:i386 ;\
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-common_2.60-1_amd64.deb ;\
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-capt_2.60-1_amd64.deb   ;\
	fi;
#	[[ $(BITS) == 64 ]] { \
#	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-common-2.60-1.x86_64.deb ;\ #64bits
#	sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-capt-2.60-1.x86_64.deb   ;\ #64bits
#	}

unzip:
	gunzip -c drivers.tar.gz | tar xopf -
	sudo chmod -R 777 ./*




