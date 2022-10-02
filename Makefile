PRG=915resolution

SRCS=915resolution.c 
OBJS=${SRCS:.c=.o}

CFLAGS:=-s -Wall -ggdb 

${PRG}: ${OBJS}

clean:
	rm -f ${OBJS} ${PRG} *~ 

install: ${PRG}
	cp ${PRG} /usr/sbin

