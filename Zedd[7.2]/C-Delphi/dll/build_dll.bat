gcc -std=c99 -Wall -Werror -pedantic -D EXPORTS -c lib.c

gcc -shared lib.o -Wl,--subsystem,windows -o cdel.dll