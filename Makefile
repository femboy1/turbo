main: main.cpp
	$(CC) main.cpp $(CXXFLAGS) -o out

CC := g++
CPPSTD=c++17
CXXFLAGS := -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables
CXXFLAGS +=  -fexceptions -fstack-clash-protection -fstack-protector-all 
CXXFLAGS +=  -fstack-protector-strong -O2 -pipe -Wall -Werror
CXXFLAGS +=  -fcf-protection -Wextra -std=$(CPPSTD)
