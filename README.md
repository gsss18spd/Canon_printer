## Canon LBP installer for debian

### Install
For debian Ubuntu 64bits, printer Canon LBP2900:

```
git clone https://github.com/hugolpz/Canon_printer.git
cd ./Canon_printer
make -f ./download.mk
sudo make -f ./install.mk BITS=64 PRINTER=LBP2900
sudo make -f ./OS_restart
sudo make -f ./install.mk BITS=64 PRINTER=LBP2900
```

If printer is not working after install & 1st restart :
```
sudo /etc/init.d/ccpd start
```

or

```
#Add printer (for LBP2900):
sudo /usr/sbin/lpadmin -p LBP2900 -m CNCUPSLBP2900CAPTK.ppd -v ccp://localhost:59787 -E  
sudo /usr/sbin/ccpdadmin -p LBP2900 -o /dev/usb/lp0
#Start daemon:
sudo service ccpd start
```

Check out status:
```
sudo /etc/init.d/ccpd status  # should show 2 four digits
captstatusui -P LBP2900       # should show "Ready to print"
 numbers.
```
### Notes
**Result:** This worked for my `LBP2900` on Ubuntu 14.04 in ~2 minutes (out of download time).

**Portability?:** should work for all the LBP series, just set the `BITS` & `PRINTER` arguments.

**Warning:** project is not maintained, but I will accept relevant pull request.


### API
* `BITS`: default `32`. Your computer is either `32` or `64` bits.
* `PRINTER`: default `LBP2900`. Change to your printer name. It will install the relevant driver such 'CNCUPSLBP2900CAPTK.ppd'. Warning : printer 2900 => driver 2900 ; but printer 3100 => driver 3150. **Find yours, Google is your friend.**

### CREDITS
* Hugo Lopez, based on Vishnu Namboothiri K's [answer](http://askubuntu.com/questions/457774/driver-canon-lbp-2900).
