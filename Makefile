ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

CFLAGS=-c -O2 -Wall -DHAISERIAL_SUPPORT -DGNUREADLINE_SUPPORT


all: hai

hai: hai.o help.o readline.o aes.o hai_net.o hai_serial.o omni_protocol.o
	gcc -o hai hai.o help.o readline.o aes.o hai_net.o hai_serial.o omni_protocol.o -lreadline -ltermcap

omni_protocol.o: omni_protocol.c
	gcc $(CFLAGS) omni_protocol.c

hai_serial.o: hai_serial.c
	gcc $(CFLAGS) hai_serial.c

hai_net.o: hai_net.c
	gcc $(CFLAGS) hai_net.c

aes.o: aes.c
	gcc $(CFLAGS) aes.c

readline.o: readline.c
	gcc $(CFLAGS) readline.c

help.o: help.c
	gcc $(CLFAGS) help.c

hai.o: hai.c
	gcc $(CFLAGS) hai.c

install: hai
	cp hai $(DESTDIR)$(PREFIX)/bin/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/hai

clean:
	rm *.o
