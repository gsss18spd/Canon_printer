PRINTER=LBP2900

runs: unzip
	sudo ./canonLBP_install.sh $(PRINTER)

unzip: download
	gunzip -c sh.tar.gz | tar xopf -

download:
	curl -L -C - http://www.ssldirectory.com/downloads/files/drivers/canon/lbpxxxx/raducotescu-CanonCAPTdriver-2401-updated%20by%20unixmen-.tar.gz -o sh.tar.gz
