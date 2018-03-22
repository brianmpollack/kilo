all: kilo

webdav_io_wrapper:
	$(MAKE) -C ../c-io-lib

kilo: webdav_io_wrapper kilo.c
	$(CC) -o kilo kilo.c -Wall -W -pedantic -std=c99 -Wl,-wrap,fopen,-wrap,fflush,-wrap,fclose,-wrap,open,-wrap,close -L../c-io-lib -lwebdaviowrapper -lcurl

clean:
	rm kilo
