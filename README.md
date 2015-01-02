
### Canon LBP installer for debian

```
git clone ...
cd ./Canon_printer
make -f download.mk
make -f install.mk
```

If printer is not working after install & restart :

If, generally speaking, printer is not working after restart:

```
make -f OS_restart.mk
```	

###
**Result:** This worked for my `LBP2900` on Ubuntu 14.04 in ~2 minutes (out of download time).

**Portability?:** should work for all the LBP series, just set the `BITS` & `PRINTER` arguments.

**Warning:** project is not maintained, but I will accept relevant pull request.

### API
* `BITS`: default `32`. Your computer is either `32` or `64` bits.
* `PRINTER`: default `LBP2900`. Change to your printer name. It will install the relevant driver such 'CNCUPSLBP2900CAPTK.ppd'. Warning : printer 2900 => driver 2900 ; but printer 3100 => driver 3150. **Find yours, Google is your friend.**

### CREDITS
* Hugo Lopez, based on Vishnu Namboothiri K's [answer](http://askubuntu.com/questions/457774/driver-canon-lbp-2900).
