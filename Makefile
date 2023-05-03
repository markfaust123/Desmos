CC = gcc
CFLAGS = -g -std=c11 -Wall -Wextra -pedantic

CXX = g++
CXXFLAGS = -g -std=c++14 -Wall -Wextra -pedantic

%.o : %.c
	$(CC) $(CFLAGS) -c $*.c -o $*.o

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $*.cpp -o $*.o

C_SRCS = pnglite.c
CXX_SRCS = main.cpp plot.cpp bounds.cpp image.cpp exception.cpp \
	reader.cpp renderer.cpp expr.cpp expr_parser.cpp func.cpp \
	fill.cpp

OBJS = $(C_SRCS:.c=.o) $(CXX_SRCS:.cpp=.o)

test :
	make test1
	make test2
	make test3
	make test4
	make test5
	make test6
	make test7
	make test8
	make test9

test1 : plot.o
	make plot
	mkdir -p actual
	./plot input/example01.txt actual/example01.png
	compare -metric RMSE actual/example01.png expected/example01.png actual/example01_diff.png
	echo $?

test2 : plot.o
	make plot
	mkdir -p actual
	./plot input/example02.txt actual/example02.png
	compare -metric RMSE actual/example02.png expected/example02.png actual/example02_diff.png
	echo $?

test3 : plot.o
	make plot
	mkdir -p actual
	./plot input/example03.txt actual/example03.png
	compare -metric RMSE actual/example03.png expected/example03.png actual/example03_diff.png
	echo $?

test4 : plot.o
	make plot
	mkdir -p actual
	./plot input/example04.txt actual/example04.png
	compare -metric RMSE actual/example04.png expected/example04.png actual/example04_diff.png
	echo $?

test5 : plot.o
	make plot
	mkdir -p actual
	./plot input/example05.txt actual/example05.png
	compare -metric RMSE actual/example05.png expected/example05.png actual/example05_diff.png
	echo $?

test6 : plot.o
	make plot
	mkdir -p actual
	./plot input/example06.txt actual/example06.png
	compare -metric RMSE actual/example06.png expected/example06.png actual/example06_diff.png
	echo $?

test7 : plot.o
	make plot
	mkdir -p actual
	./plot input/example07.txt actual/example07.png
	compare -metric RMSE actual/example07.png expected/example07.png actual/example07_diff.png
	echo $?

test8 : plot.o
	make plot
	mkdir -p actual
	./plot input/example08.txt actual/example08.png
	compare -metric RMSE actual/example08.png expected/example08.png actual/example08_diff.png
	echo $?

test9 : plot.o
	make plot
	mkdir -p actual
	./plot input/example09.txt actual/example09.png
	compare -metric RMSE actual/example09.png expected/example09.png actual/example09_diff.png
	echo $?

testing : testing.o 
	$(CXX) testing.o -o testing && ./testing

testing.o : 
	make depend
	$(CXX) $(CXXFLAGS) testing.cpp -c

plot : $(OBJS)
	make depend
	$(CXX) -o $@ $(OBJS) -lm -lz

clean :
	rm -f *.o plot testing

depend :
	$(CC) -M $(CFLAGS) $(C_SRCS) > depend.mak
	$(CXX) -M $(CXXFLAGS) $(CXX_SRCS) >> depend.mak

depend.mak :
	touch $@

include depend.mak
