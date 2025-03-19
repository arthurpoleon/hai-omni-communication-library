ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

CFLAGS=-c -O2 -Wall -fPIC -DHAISERIAL_SUPPORT -DGNUREADLINE_SUPPORT  

VPATH = src
LIB_NAME = haiOmnicommunicationLib
SHARED_LIB = haiOmnicommunicationLib.so
SRC_FILES = src/haiLibMain.c  src/aes.c  src/hai_net.c  src/hai_serial.c  src/omni_protocol.c  src/readline.c 
	
OBJ_FILES = haiLibMain.o aes.o   hai_net.o  hai_serial.o    omni_protocol.o  readline.o

# Define compiler and flags
CC = gcc
#CFLAGS = -Wall -g 

# Define archiver
AR = ar
ARFLAGS = rcs
LDFLAGS = -shared

# Default target: create the static library
hailib: $(LIB_NAME).a

haisharedlib: $(LIB_NAME).so

$(LIB_NAME).so: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $@ $(OBJ_FILES)


# Rule to create object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to create the static library
$(LIB_NAME).a: $(OBJ_FILES)
	$(AR) $(ARFLAGS) $@ $^

# Clean target: remove object files and the library
clean:
	rm -f $(OBJ_FILES) $(LIB_NAME).a $(LIB_NAME).so

#==============================================================================

# all: hai

# hai: hai.o help.o readline.o aes.o hai_net.o hai_serial.o omni_protocol.o
# 	gcc -o hai hai.o help.o readline.o aes.o hai_net.o hai_serial.o omni_protocol.o -lreadline -ltermcap

# omni_protocol.o: omni_protocol.c
# 	gcc $(CFLAGS) src/omni_protocol.c

# hai_serial.o: hai_serial.c
# 	gcc $(CFLAGS) src/hai_serial.c

# hai_net.o: hai_net.c
# 	gcc $(CFLAGS) src/hai_net.c

# aes.o: aes.c
# 	gcc $(CFLAGS) src/aes.c

# readline.o: readline.c
# 	gcc $(CFLAGS) src/readline.c

# help.o: help.c
# 	gcc $(CLFAGS) src/help.c 

# hai.o: hai.c
# 	gcc $(CFLAGS) src/hai.c

# install: hai
# 	cp hai $(DESTDIR)$(PREFIX)/bin/

# uninstall:
# 	rm -f $(DESTDIR)$(PREFIX)/bin/hai

# clean:
# 	rm *.o
