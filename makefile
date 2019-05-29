CC=gcc
includes:= -i ./lib/
CFLAGS:= -g
SRC= ./test/main.c
OBJ= $(SRC:.cpp=.o)
# the @ sign is each object file
# ^ says all prereqs

#The following rule applies to c++ files and causes all c++ files to
#be complied with the correct flags
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

# $@ puts the target name
# $^ will put all the depends
matrix: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJ) accel
