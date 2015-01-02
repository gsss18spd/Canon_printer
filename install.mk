# RUN ##############################################
# make -f install.mk BITS=32 PRINTER=LBP2900

#http://askubuntu.com/questions/457774/driver-canon-lbp-2900
BITS=32
# SOURCES #########################################
printer_status: printer_daemon
	captstatusui -P $(PRINTER)
	echo "If you are seeing the message 'Ready to print', you are done! Else: restart the system, and repeat all the steps from step 4."

printer_daemon: add_printer
	sudo service ccpd start
	sudo service ccpd status

add_printer: restart_printer
	sudo /usr/sbin/lpadmin -p $(PRINTER) -m CNCUPS$(PRINTER)CAPTK.ppd -v ccp://localhost:59787 -E  
	sudo /usr/sbin/ccpdadmin -p $(PRINTER) -o /dev/usb/lp0

# After restart ^ (upper) --------------------------------------------

restart_printer: deb_install dep_install
	service cups restart
dep_install: unzip deb_install
	sudo apt-get install portreserve gsfonts gsfonts-other gsfonts-X11

deb_install: unzip
	read -p "Computer bits-rate ? (32 or 64):  " BITS
	if [ $(BITS) = 32 ] ; then \
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/32-bit_Driver/Debian/cndrvcups-common_2.60-1_i386.deb ;\
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/32-bit_Driver/Debian/cndrvcups-capt_2.60-1_i386.deb   ;\
	fi;
	if [ $(BITS) = 64 ] ; then \
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-common_2.60-1_amd64.deb ;\
		sudo dpkg -i ./Linux_CAPT_PrinterDriver_V260_uk_EN/64-bit_Driver/Debian/cndrvcups-capt_2.60-1_amd64.deb   ;\
	fi;

unzip:
	gunzip -c drivers.tar.gz | tar xopf -





